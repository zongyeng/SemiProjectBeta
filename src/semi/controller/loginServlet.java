package semi.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;

import semi.biz.loginBiz;
import semi.dto.loginDto;

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
		
		if(command.equals("login")) {
			
			response.sendRedirect("UserLogin.jsp");
			
			
		}else if(command.equals("loginres")){
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			loginDto dto = biz.login(id, password);
			try{
				dto.getUserinfo_seq();
			} catch (NullPointerException e) {
				//실패일시 메인페이지나 로그인페이지로 가면서 경고메세지. 아이디와 비밀번호를 확인해 주세요.
				response.sendRedirect("login.do?command=login");
			}
			
			HttpSession session=request.getSession();
			
			session.setAttribute("userdto", dto);
			session.setMaxInactiveInterval(10*60);
			
			//성공일시 send리엑티브 또는 디스패치 포워드
			response.sendRedirect("Mainhome.jsp");
			
		}else if(command.equals("signup")) {
			
			response.sendRedirect("UserSignUp.jsp");

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
