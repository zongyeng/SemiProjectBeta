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
<link href="resources/index.css" rel="stylesheet" type="text/css">
<style type="text/css">

.ir{
	color:white;
	background-color: black;
	font-size:21px;
}
.login_box{
}

</style>
</head>
<body>
	<div class="con">
		<form action="login.do" method="post">
			<input type="hidden" name="command" value="loginres">
			<div class="login">
				<h1>LOGIN</h1>
			</div>
			<div class="input_box">
				<div>
					<input type="text" placeholder="ID" name="id"> <input type="password"
						placeholder="PASSWORD" name="password">
				</div>
			</div>
			<div class="login_box" style="margin-bottom: 15px;">
				<div>
				<input type="submit" class="ir" value="로그인"><br/>
				</div>
			</div>
		</form>
		<div>
			<div>
				<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

				<a id="kakao-login-btn"></a> 
<a href="http://developers.kakao.com/logout"></a>
	<script type='text/javascript'>
	
Kakao.init('8e6d53d7202906065b4fa4f403a2bee0');

	Kakao.Auth.createLoginButton({
	container : '#kakao-login-btn',
	success : function(authObj) {
	Kakao.API.request({

		url: '/v2/user/me',

		success: function(res) {
			   
			location.href="login.do?command=snslogin&id="+res.properties['nickname'];
      
		}
	})

},fail : function(err) {alert("로그인 실패 했습니다. 고객센터에 문의해 주세요.");}});

				</script>
			</div>
		</div>
		<div class="sub">
			<ul>
				<li><a href="#" onclick="window.open('useridsearch.jsp','searchid','width=456, height=510')">아이디 찾기</a></li>
				<li><a href="#" onclick="window.open('userpasswordsearch.jsp','searchpassword','width=456, height=510')">비밀번호 찾기</a></li>
				<li><a href="#" onclick="location.href='UserSignUp.jsp'">회원가입</a></li>

			</ul>
		</div>
	</div>
	<br />
	<%@ include file="./form/footer.jsp"%>
</body>
</html>