package semi.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.biz.chattingBiz;
import semi.dao.chattingDao;

@WebServlet("/chattingServlet")
public class chattingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public chattingServlet() { super(); }

    chattingBiz biz = new chattingBiz();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("chattingsupport")) {
			int control = 10;
			int seq = 10;
			try {
				control = Integer.parseInt(request.getParameter("userinfo_controlno"));
				seq = Integer.parseInt(request.getParameter("userinfo_seq"));
			} catch (NumberFormatException e) {
				System.out.println("비 로그인 유저입니다.");
			}
			request.setAttribute("dto", biz.selectOne(seq));
			
			if(control==0) {
				dispatch(request, response, "chating.jsp");
			} else {
				dispatch(request, response, "chatinguser.jsp");
			}
		}
		
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
}
