package semi.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.dto.MusicBoardDto;
import semi.biz.MusicBoardBiz;

@WebServlet("/boardServlet")
public class boardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public boardServlet() { super(); }

    MusicBoardBiz biz = new MusicBoardBiz();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("list")) {
			List<MusicBoardDto> list = (List<MusicBoardDto>)request.getAttribute("list");
			list = biz.selectList_musicbd();
			System.out.println("list:"+list.size());
			request.setAttribute("list", list);
			dispach(request, response, "boardlist.jsp");
			//response.sendRedirect("boardlist.jsp");
		} else if(command.equals("detail")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			System.out.println("boardno:"+boardno);
			MusicBoardDto dto  = biz.selectOne_musicbd(boardno);
			request.setAttribute("dto", dto);
			
			//response.sendRedirect("boarddtail.jsp");
			dispach(request, response, "boarddtail.jsp");
		} else if(command.equals("insert")) {
			response.sendRedirect("boardinsert.jsp");
		} else if(command.equals("insertres")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			MusicBoardDto dto = new MusicBoardDto();
			dto.setMusicbd_content(content);
			dto.setMusicbd_title(title);
			dto.setMusicbd_writer(writer);
			int res = biz.insert_musicbd(dto);
			
			if(res > 0) {
				alertProc(response, "글 작성 성공", "board.do?command=list");
			} else {
				alertProc(response, "글 작성 실패", "history.back");
			}
		} else if(command.equals("delete")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			int res = biz.delete_musicbd(boardno);
			
			if(res > 0) {
				alertProc(response, "글삭제 성공", "board.do?command=list");
			} else {
				alertProc(response, "글삭제 실패", "board.do?command=list");
			}
			dispach(request, response, "answer.do?command=list");
		
		} else if(command.equals("update")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			System.out.println("boardno:"+boardno);
			MusicBoardDto dto  = biz.selectOne_musicbd(boardno);
			request.setAttribute("dto", dto);
			dispach(request, response, "updateform.jsp");
		} else if(command.equals("updateres")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			MusicBoardDto dto = new MusicBoardDto();
			dto.setMusicbd_boardno(boardno);
			dto.setMusicbd_title(title);
			dto.setMusicbd_content(content);
						
			int res = biz.update_musicbd(dto);
			if(res > 0) {
				alertProc(response, "글 수정 성공", "board.do?command=detail&boardno="+boardno);
				//dispach(request, response, "board.do?command=detail&boardno"+boardno);
			} else {
				alertProc(response, "글 수정 실패", "history.back");
			}
			
		} else if(command.equals("answer")) {
			int boardno = Integer.parseInt(request.getParameter("boardno"));
			System.out.println("boardno:"+boardno);
			MusicBoardDto dto  = biz.selectOne_musicbd(boardno);
			request.setAttribute("dto", dto);
			dispach(request, response, "boardanswer.jsp");
		} else if(command.equals("answerres")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			System.out.println("boardno:"+parentboardno);
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			MusicBoardDto dto = new MusicBoardDto();
			dto.setMusicbd_boardno(parentboardno);
			dto.setMusicbd_title(title);
			dto.setMusicbd_content(content);
			dto.setMusicbd_writer(writer);
			int res = biz.answerProc_musicbd(dto);
			if(res > 0) {
				alertProc(response, "답변 작성 성공", "board.do?command=list");
			} else {
				alertProc(response, "답변 작성 실패", "board.do?command=answer");
			}
		}
			
	}


	public void dispach(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispach = request.getRequestDispatcher(url);
		dispach.forward(request, response);

		
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	public void alertProc(HttpServletResponse response, String msg, String path) throws IOException {
		System.out.println("path:"+path);
		PrintWriter out = response.getWriter();
		out.println("<script type='text/javascript'>");
		out.println("alert('"+msg+"')");
		out.println("location.href='"+path+"'");
		out.println("</script>");
	}
}
