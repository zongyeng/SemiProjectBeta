package semi.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 실패 : 아이디 또는 비밀번호를 확인해 주십시요.')");
				out.println("location.href='login.do?command=login'");
				out.println("</script>");
				
				return;
			}
			
			HttpSession session=request.getSession();
			
			session.setAttribute("userdto", dto);
			session.setMaxInactiveInterval(10*60);
			
			//성공일시 send리엑티브 또는 디스패치 포워드
			response.sendRedirect("Mainhome.jsp");
			
		}else if(command.equals("signup")) {
			
			response.sendRedirect("UserSignUp.jsp");

		}else if(command.equals("signupres")) {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String nickname = request.getParameter("nickname");
			String password = request.getParameter("password");
			String password1 = request.getParameter("password1");
			char sex = request.getParameter("sex").charAt(0);
			int age = Integer.parseInt(request.getParameter("age"));
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			int check = biz.signup(name, nickname,id,password,password1,sex,age,phone,email);

			PrintWriter out = response.getWriter();
			if(check>0) {
				out.println("<script>");
				out.println("alert('회원가입 성공')");
				out.println("location.href='login.do?command=login'");
				out.println("</script>");
			} else if(check==-1) {
				out.println("<script>");
				out.println("alert('회원가입 실패. 패스워드가 일치하지 않습니다.')");
				out.println("window.history.go(-1);");
				out.println("</script>");
			} else if(check==-2) {
				out.println("<script>");
				out.println("alert('회원가입 실패. 패스워드는 9자 이상 이여야 합니다.')");
				out.println("window.history.go(-1);");
				out.println("</script>");
			}
			
				// 회원가입 성공시
		} else if(command.equals("idchk")) {
			String id = request.getParameter("id");
			
			PrintWriter out= response.getWriter();
			
			
			if(id.equals("")) {
				out.println("아이디를 입력해주세요");
			} else if(biz.idchk(id)) {
				out.println("사용 가능한 아이디 입니다.");
			} else {
				out.println("이미 사용한 아이디 입니다.");
			}
			
			
		} else if(command.equals("pwc")) {
			
		} else if(command.equals("logout")) {
			HttpSession session=request.getSession();
			session.removeAttribute("userdto");
			response.sendRedirect("Mainhome.jsp");
		} else if(command.equals("update")) {
			int userinfo_seq = Integer.parseInt(request.getParameter("seq"));
			String userinfo_id = request.getParameter("id");
			String userinfo_name = request.getParameter("name");
			String userinfo_nickname = request.getParameter("nickname");
			String userinfo_password = request.getParameter("password1");
			String userinfo_password2 = request.getParameter("password2");
			int userinfo_age = Integer.parseInt(request.getParameter("age"));
			String userinfo_phonenumber = request.getParameter("phone");
			String userinfo_email = request.getParameter("email");
			
			loginDto updatedto = new loginDto();
			updatedto.setUserinfo_seq(userinfo_seq);
			updatedto.setUserinfo_id(userinfo_id);
			updatedto.setUserinfo_name(userinfo_name);
			updatedto.setUserinfo_nickname(userinfo_nickname);
			updatedto.setUserinfo_password(userinfo_password);
			updatedto.setUserinfo_age(userinfo_age);
			updatedto.setUserinfo_phonenumber(userinfo_phonenumber);
			updatedto.setUserinfo_email(userinfo_email);
			
			PrintWriter out = response.getWriter();
			int res = biz.update(updatedto,userinfo_password2);
			System.out.println(res);
			if(res==0) {
				out.println("<script>");
				out.println("alert('입력정보를 재 확인 해주세요.');");
				out.println("window.history.go(-1);");
				out.println("</script>");
			} else if(res==-1) {
				out.println("<script>");
				out.println("alert('비밀번호 길이는 9자 이상입니다.');");
				out.println("window.history.go(-1);");
				out.println("</script>");
			} else if(res==-2) {
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.');");
				out.println("window.history.go(-1);");
				out.println("</script>");
			} else {
				HttpSession session=request.getSession();
				session.removeAttribute("userdto");
				out.println("<script>");
				out.println("alert('수정 성공');");
				out.println("location.href='Mainhome.jsp'");
				out.println("</script>");
			}
			
		} else if(command.equals("withdrawal")) {
			int userseq = Integer.parseInt(request.getParameter("seq"));
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("if (confirm('정말 탈퇴 하시겠습니까?') == true){");
			out.println("location.href='login.do?command=withdrawalres&seq="+userseq+"';");
			out.println("}else{");
			out.println("window.history.go(-1);");
			out.println("}");
			out.println("</script>");
		} else if(command.equals("withdrawalres")) {
			int userseq = Integer.parseInt(request.getParameter("seq"));
			PrintWriter out = response.getWriter();
			if(biz.withdrawal(userseq)) {
				HttpSession session=request.getSession();
				session.removeAttribute("userdto");
				out.println("<script>");
				out.println("alert('탈퇴 성공');");
				out.println("location.href='Mainhome.jsp'");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("alert('탈퇴 실패. 문의하기에 문의해보세요.');");
				out.println("window.history.go(-1);");
				out.println("</script>");
			}
			
		} else if(command.equals("nicknamechk")) {
			String nickname = request.getParameter("nickname");
			
			PrintWriter out= response.getWriter();
			
			if(nickname=="") {
				out.println("닉네임을 입력해주세요");
			} else if(biz.nicknamechk(nickname)) {
				out.println("사용 가능한 닉네임 입니다.");
			} else {
				out.println("이미 사용한 닉네임 입니다.");
			}
			
		}
		
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	
	}

}
