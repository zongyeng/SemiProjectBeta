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


				<a id="kakao-login-btn"></a> <a
					href="http://developers.kakao.com/logout"></a>
				<script type='text/javascript'>
					//<![CDATA[
					// 사용할 앱의 JavaScript 키를 설정해 주세요.
					Kakao.init('fc8ab3698db7ab3ac3d09a0c9bc4a2e4');
					// 카카오 로그인 버튼을 생성합니다.
					Kakao.Auth.createLoginButton({
						container : '#kakao-login-btn',
						success : function(authObj) {
							alert(JSON.stringify(authObj));
						},
						fail : function(err) {
							alert(JSON.stringify(err));
						}
					});
					//]]>
				</script>
			</div>
		</div>
		<div class="sub">
			<ul>
				<li><a href="#">아이디 찾기</a></li>
				<li><a href="#">비밀번호 찾기</a></li>
				<li><a href="#" onclick="location.href='UserSignUp.jsp'">회원가입</a></li>

			</ul>
		</div>
	</div>
	<br />
	<%@ include file="./form/footer.jsp"%>
</body>
</html>