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
</head>
<body>
<div id="style" class="myform">
<form id="form" name="form" method="post">
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
<input type="text" name="password1" id="password1" />

<label>Password
<span class="small">패스워드 확인</span>
</label>
<input type="text" name="password2" id="password2" />

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

<button type="submit">회원가입 완료</button>
<div class="spacer"></div>

</form>
</div>

</body>
</html>