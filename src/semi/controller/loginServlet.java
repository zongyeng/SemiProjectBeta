package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.biz.loginBiz;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public loginServlet() {
		super();
	}

	loginBiz biz = new loginBiz();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		if(command.equals("log")) {
				//로그인페이지
			
			
			
		}else if(command.equals("logres")){
				//로그인성공시 or 실패시
		}else if(command.equals("signup")) {
				// 회원가입페이지로
		}else if(command.equals("signupres")) {
				// 회원가입 성공시
		}else if(command.equals("idc")) {
			
		}else if(command.equals("idc1")) {
			
		}else if(command.equals("pwc")) {
			
		}else if(command.equals("pwc1")) {
			
		}
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

}
