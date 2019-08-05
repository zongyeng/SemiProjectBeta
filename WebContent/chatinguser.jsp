<%@page import="semi.dto.chattingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 고객센터</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>

<%
	try{
		chattingDto dto = (chattingDto)request.getAttribute("dto");
		if(dto.getUserinfo_controlno()!=0){
%>

<body>
	<fieldset>
		<textarea id="messageWindow" rows="10" cols="50" readonly="readonly"></textarea>
		<br/>
		
		
		
		<input id="inputMessage" type="text"/>
		<input type="submit" value="보내기" onclick="send()" />
	</fieldset>
</body>

<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
 
	var webSocket = new WebSocket('ws://192.168.10.170:8787/SemiProjectBeta/broadcasting?seq=<%=dto.getUserinfo_seq()%>');
	var inputMessage = document.getElementById('inputMessage');
 
	webSocket.onerror = function(event) {
		onError(event)
	};

	webSocket.onopen = function(event) {
		onOpen(event)
	};

	webSocket.onmessage = function(event) {
		
		onMessage(event)
	};
	 
	webSocket.onclose = function(message){
		
	};
	
    function onMessage(event) {
        textarea.value += "상담원 : "+ event.data + "\n";
    }
 
    function onOpen(event) {
        textarea.value += "연결 성공\n";
    }
 
	function onError(event) {
		alert(event.data);
	}

	function send() {
		
		textarea.value += "<%=dto.getUserinfo_nickname()%> : " + inputMessage.value + "\n";
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
		
	}

</script>

<%
		} else {
%>
	<body>
		<h1> 관리자 ID 입니다. 관리자 페이지로 넘어갑니다. </h1>
		<script type="text/javascript">
		
			location.href="chating.jsp?userinfo_controlno=<%=dto.getUserinfo_controlno()%>&userinfo_seq=<%=dto.getUserinfo_seq()%>"
		
		</script>
	</body>
<%
		}
	}catch(NullPointerException e) {
%>
	<body>
		<h1> 비 로그인시 접근 불가능 합니다. </h1>
	</body>
<%		
	}
%>
</html>