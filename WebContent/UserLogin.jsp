<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/index.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="con">
    <div class="login">
        <h1>LOGIN</h1>
    </div>
    <div class="input_box">
        <div>
            <input type="text" placeholder="ID">
            <input type="password" placeholder="PASSWORD">
        </div>
    </div>
    <div class="login_box" style="margin-bottom: 15px;">
        <div>
            <a href="#">
                <p>로그인</p>
            </a>
        </div>
    </div>
    <div >
        <div>
                  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript' >
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('fc8ab3698db7ab3ac3d09a0c9bc4a2e4');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
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
            <li><a href="#" onclick="location.href='signup.jsp'">회원가입</a></li>
            
        </ul>
    </div>
</div>
<br/>
<%@ include file="./form/footer.jsp"%>
</body>
</html>