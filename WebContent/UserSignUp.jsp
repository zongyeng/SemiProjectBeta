<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/loginform.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/loginform.js"></script>
<style type="text/css">
a{
	color:white;
}
	</style>
	</head>
	<body>
<div id="style" class="myform">
<form action="login.do" id="form" name="form" method="post">
<input type="hidden" name="command" value="signupres">
<h1>회원가입</h1>
<p>모두 입력해 주세요.</p>

<label>ID
<span class="small">아이디 입력</span>
</label>
<input type="text" name="id" id="id" /> 

<label>Name
<span class="small">이름 입력</span>
</label>
<input type="text" name="name" id="name" />

<label>NickName
<span class="small">닉네임 입력</span>
</label>
<input type="text" name="nickname" id="nickname" />

<label>Password
<span class="small">패스워드 8자이상</span>
</label>
<input type="text" name="password" id="password" />

<label>Password
<span class="small">패스워드 확인</span>
</label>
<input type="text" name="password" id="password" />

<label>sex
<span class="small">성별</span>
</label>
<input type="text" name="sex" id="sex" />

<label>age
<span class="small">나이대 선택</span>
</label>
<input type="text" name="age" id="age" />

<label>Phone
<span class="small">전화번호 입력</span>
</label>
<input type="text" name="phone" id="phone" />

<label>Email
<span class="small">이메일주소</span>
</label>
<input type="text" name="email" id="email" />

<button type="submit" id="submit">회원가입 완료</button>
<br/><br/>
<button type="button" onclick="location.href='UserLogin.jsp'">뒤로가기</button>
<div class="spacer"></div>

</form>
</div>
<br/><br/><br/><br/><br/><br/>
<%@ include file="./form/footer.jsp"%>
</body>
</html>