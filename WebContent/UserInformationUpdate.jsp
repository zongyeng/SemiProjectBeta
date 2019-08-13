<%@page import="semi.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/loginform.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/loginform.js"></script>
<%
	loginDto userinfo = (loginDto) session.getAttribute("userdto");
%>
<style type="text/css">
<<<<<<< HEAD
a{
	color:white;
=======
a {
	color: white;
>>>>>>> branch 'master' of https://github.com/zongyeng/SemiProjectBeta.git
}
</style>
</head>
<body>
	<div id="style" class="myform">
		<form id="form" name="form" method="post" action="login.do">
		<input type="hidden" name= "command" value="update" />
		<input type="hidden" name= "seq" value="<%= userinfo.getUserinfo_seq() %>" />
			<h1>회원 정보 수정</h1>
			<p>수정해주세요. 수정 완료후에는 재로그인이 필요합니다.</p>
			<div>
				<label>ID <span class="small">아이디</span></label> 
				<input type="text" name="id" id="id" value="<%=userinfo.getUserinfo_id()%>" />
				<label>Name <span class="small">이름</span></label> 
				<input type="text" name="name" id="name" value="<%=userinfo.getUserinfo_name()%>" /> 
				<label>NickName<span class="small">닉네임</span></label>
				<input type="text" name="nickname" id="nickname" value="<%=userinfo.getUserinfo_nickname()%>" />
				<label>Password<span class="small">패스워드</span></label>
				<input type="password" name="password1" id="password1" value="" />
				<label>Password<span class="small">패스워드 확인</span></label>
				<input type="password" name="password2" id="password2" value="" />
				<label>AGE <span class="small">나이대 선택</span></label>
				<input type="text" name="age" id="age" value="<%=userinfo.getUserinfo_age()%>" />
				<label>Phone <span class="small">전화번호</span></label>
				<input type="text" name="phone" id="phone" value="<%=userinfo.getUserinfo_phonenumber()%>" />
				<label>Email<span class="small">이메일주소</span></label>
				<input type="text" name="email" id="email" value="<%=userinfo.getUserinfo_email()%>" />
			</div>
			<div>
				<button type="submit" id="submit">수정하기</button>
				<button type="button" onclick="window.history.go(-1); return false;">뒤로가기
				</button>
				<div class="spacer"></div>
			</div>
		</form>
	</div>
	<br />
	<br />
	<%@ include file="./form/footer.jsp"%>
</body>
</html>