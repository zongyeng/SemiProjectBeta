<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/chatting.js"></script>

</head>
<body>

	<div>
		<img alt="supportchat" src="images/chattingimg.png" onclick="supportchat()" />
		controlno<input id="TESTcontrolno" type="text" />
		userinfo_seq<input id="TESTseq" type="text" />
	</div>
	<div>관리자는 0 1 넣으시고 상담자는 1 2 대기자는 2 3 을 넣어주세요 상담자와 대기자는 바뀌어도 됩니다. 처음 관리자를 넣지 않으면 통신이 되지 않습니다. 아직 에러 페이지를 만들지 않았습니다. 중복입장에대한 에러 페이지도 아직 안만들었어요.</div>

</body>
</html>