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
<%
	loginDto userinfo = (loginDto) session.getAttribute("userdto");
%>
<link href="resources/loginform.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/loginform.js"></script>
<style type="text/css">
a {
	color: white;
}
</style>
</head>
<body>
	<div id="style" class="myform">
		<form id="form" name="form" method="post" action="UserInformationUpdate.jsp">
			<h1>정보보기</h1>
			<div>
				<label>ID <span class="small">아이디</span></label> 
				<input type="text" name="id" id="id" readonly="readonly"
					value="<%=userinfo.getUserinfo_id()%>" />
				<label>Name <span class="small">이름</span></label> 
				<input type="text" name="name" id="name" readonly="readonly"
					value="<%=userinfo.getUserinfo_name()%>" /> 
				<label>NickName<span class="small">닉네임</span></label> 
				<input type="text" name="nickname" id="nickname"
					readonly="readonly" value="<%=userinfo.getUserinfo_nickname()%>" />
				<label>AGE <span class="small">나이대 선택</span></label>
				<input type="text" name="age" id="age" readonly="readonly"
					value="<%=userinfo.getUserinfo_age()%>" />
				<label>Phone <span class="small">전화번호</span></label>
				<input type="text" name="phone" id="phone" readonly="readonly"
					value="<%=userinfo.getUserinfo_phonenumber()%>" />
				<label>Email<span class="small">이메일주소</span></label>
				<input type="text" name="email" id="email" readonly="readonly"
					value="<%=userinfo.getUserinfo_email()%>" />
			</div>
			<div>
				<button type="submit" id="submit">수정하기</button>
				<button type="button" onclick="location.href='login.do?command=withdrawal&seq=<%=userinfo.getUserinfo_seq()%>'">탈퇴하기</button>
				<button type="button" onclick="location.href='pagemoving.do?command=userportfolio&userseq=<%=userinfo.getUserinfo_seq()%>'" >내 포트폴리오 가기</button><br/>
				<button type="button" onclick="location.href='pagemoving.do?command=userportfolioupdate&userseq=<%=userinfo.getUserinfo_seq()%>'" >포트폴리오 수정</button>
				<button type="button" onclick="location.href='pagemoving.do?command=cashcharge'" >결제하기</button>
				<button type="button" onclick="window.history.go(-1); return false;" >뒤로가기</button><br/>
			</div>
			<div class="spacer"></div>

		</form>
	</div>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>