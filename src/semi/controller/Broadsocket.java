package semi.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import semi.biz.chattingBiz;
import semi.dto.chattingDto;

@ServerEndpoint("/broadcasting")
public class Broadsocket {
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<Session>());
	private static Session Consultant = null;
	private static Session Counselor = null;
	private static HashMap<Session, String> nicknames = new HashMap<Session, String>();
	private static chattingDto dto = null;
	
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		
		synchronized (clients) {
			if(message.indexOf("(SyStEm)USER[NONE])")==0) {
				if(session.isOpen()) {
					Consultant.getBasicRemote().sendText(message);
				}
			} else if (message.indexOf("(SyStEm)EXIT") == 0) {
				if(message.indexOf("WAIT") != -1) {
					if(Consultant.isOpen()) {
						Consultant.getBasicRemote().sendText(message);
					}
				} else if(message.indexOf("ALL") != -1) {
					session.getBasicRemote().sendText(message);
				} else {
					int beginIndex = message.indexOf("USER=") + 5;
					int endIndex = message.indexOf("]");
					String nickname = message.substring(beginIndex, endIndex);
					
					getSession(nicknames, nickname).getBasicRemote().sendText(message);
					System.out.println(Counselor==getSession(nicknames, nickname));
					//과연 동기화는? 되긴 되는데...
					oneUserExit(nickname);
				}
			} else if (Consultant == session) {
				try {
					if(Counselor.isOpen()) {
						Counselor.getBasicRemote().sendText(message);
					}
				} catch (NullPointerException e) {
					System.out.println("상담을 진행하지 않았습니다.Counselor=null;");
				}
			} else if(Counselor == session){
				if(Consultant.isOpen()) {
					Consultant.getBasicRemote().sendText(message);
				}
			}
		}
		
	}

	@OnOpen
	public void onOpen(Session session) {

		dto = createdto(session);

		if (inputConsultant(session)) {
			System.out.println("상담원 입장");
		}

		if (inputCounselor(session)) {
			System.out.println("상담자 입장");
		}

		if (noConsultantRoom(session, dto)) {
			return;
		}

		if (overlapNickname(session, dto)) {
			return;
		}

		clients.add(session);
		addNickname(session, dto);

		try {
			sendUserinfoForm(dto);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@OnClose
	public void onClose(Session session) {

		if(session!=Counselor&&session!=Consultant) {
			try {
				onMessage("(SyStEm)EXIT[WAIT="+nicknames.get(session)+"]", session);
				System.out.println("대기자 "+nicknames.get(session)+"님께서 나가셨습니다.");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		try{
			if (clients.get(0).equals(session) && clients.size() > 1) {
				allUserExit(session);
				System.out.println("상담이 불가능 하여 모든 상담자가 퇴장처리 되었습니다.");
			}
		} catch (IndexOutOfBoundsException e) {
			System.out.println("상담준비가 안되어서 clients리스트가 만들어 지지 않았습니다.");
		}

		clients.remove(session);

		removeNickname(session);
		
		if (clients.size() > 1 && session == Counselor) {
			changeCounselor(clients.get(1));
		} else {
			System.out.println("대기자가 없습니다.");
			try {
				onMessage("(SyStEm)USER[NONE]", session);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@OnError
	public void handleError(Throwable t) {
		t.printStackTrace();
	}
	
	
	
	public boolean changeCounselor(Session session) {
		Counselor = session;
		try {
			onMessage("(SyStEm)USER[CHANGE]", Consultant);
			onMessage("(SyStEm)USER[CHANGE]", Counselor);
			System.out.println("변경된 Counselor = " + nicknames.get(Counselor));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	private void allUserExit(Session session) {
		synchronized (clients) {
			for (Session client : clients) {
				if (!session.equals(client)) {
					try {
						onMessage("(SyStEm)EXIT[USER=ALL]", client);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			List<Session> clientsclone = new ArrayList<Session>();
			clientsclone.addAll(clients);
			for (int i = clients.size() - 1; i >= 1; i--) {
				try {
					clientsclone.get(i).close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			clientsclone.clear();
		}
	}

	public static Session getSession(HashMap<Session, String> m, Object value) {
		for (Session o : m.keySet()) {
			if (m.get(o).equals(value)) {
				return o;
			}
		}
		return null;
	}

	private synchronized void oneUserExit(String nickname) throws IOException {
		getSession(nicknames, nickname).close();
	}

	private boolean noConsultantRoom(Session session, chattingDto dto) {
		if (clients.size() < 1 && dto.getUserinfo_controlno() != 0) {
			System.out.println("상담 가능하지 않습니다.");
			try {
				session.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return true;
		}
		return false;
	}

	public chattingDto createdto(Session session) {
		int seq = Integer.parseInt(String.valueOf(session.getRequestURI())
				.substring(String.valueOf(session.getRequestURI()).indexOf("seq") + 4));
		chattingBiz biz = new chattingBiz();
		dto = biz.selectOne(seq);

		return dto;
	}

	public boolean inputCounselor(Session session) {
		if (dto.getUserinfo_controlno() != 0 && clients.size() < 2) {
			Counselor = session;
			return true;
		}
		return false;
	}

	public boolean inputConsultant(Session session) {
		if (dto.getUserinfo_controlno() == 0) {
			Consultant = session;
			return true;
		}
		return false;
	}

	public void addNickname(Session session, chattingDto dto) {
		nicknames.put(session, dto.getUserinfo_nickname());
	}

	// 자료의 직접적인 관리는 chatting.jsp에서 실시합니다.
	public void sendUserinfoForm(chattingDto dto) throws IOException {
		Consultant.getBasicRemote()
				.sendText("(SyStEm)USER[SEQ=" + dto.getUserinfo_seq() + ",NAME=" + dto.getUserinfo_name() + ",NICKNAME="
						+ dto.getUserinfo_nickname() + ",SEX=" + dto.getUserinfo_sex() + ",PHON="
						+ dto.getUserinfo_phoneumber() + ",EMAIL=" + dto.getUserinfo_email() + "]");
	}

	public boolean overlapNickname(Session session, chattingDto dto) {
		for (Session client : clients) {
			try {
				if (nicknames.get(client).equals(dto.getUserinfo_nickname())) {
					System.out.println(nicknames.get(client) + "님 중복입장");
					session.close();
					return true;
				}
			} catch (NullPointerException e) {
				System.out.println("첫 입장입니다.(닉네임스 null 포인터)");
				return false;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean removeNickname(Session session) {
		System.out.println(nicknames.get(session) + "님 나가셨습니다.");
		return nicknames.remove(session) == null ? false : true;
	}
}
