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
<form id="form" name="form" method="post">
<h1>회원 정보 수정</h1>
<p>수정해주세요</p>

<label>ID
<span class="small">아이디</span>
</label>
<input type="text" name="id" id="id" readonly="readonly" value ="뭔가 아이디" /> 

<label>Name
<span class="small">이름</span>
</label>
<input type="text" name="name" id="name" />

<label>NickName
<span class="small">닉네임</span>
</label>
<input type="text" name="nickname" id="nickname" />

<label>Password
<span class="small">패스워드</span>
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
<span class="small">전화번호</span>
</label>
<input type="text" name="phone" id="phone" />

<label>Email
<span class="small">이메일주소</span>
</label>
<input type="text" name="email" id="email" />

<button type="submit" id="submit">수정하기</button>
<button type="button">탈퇴하기</button>
<br/>
<button type="button" onclick="location.href='login.jsp'">뒤로가기	</button>
<div class="spacer"></div>

</form>
</div>
<br/><br/><br/><br/><br/><br/>
<%@ include file="./form/footer.jsp"%>
</body>
</html>