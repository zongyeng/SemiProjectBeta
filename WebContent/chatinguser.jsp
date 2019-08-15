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

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<style type="text/css">

	fieldset>div{
	
		text-align: right;
		
	}
	
	body>div{
	
		display: none;
		text-align: center;
		margin: 100px auto 100px auto;
		
	}

</style>
	
</head>

<%
	try{
		chattingDto dto = (chattingDto)request.getAttribute("dto");
		if(dto.getUserinfo_controlno()!=0){
%>

<body>
	<fieldset>
		<textarea id="messageWindow" rows="20" cols="55" readonly="readonly"></textarea>
		<br/>
		<p>입력창</p>
		<div>
			
			<textarea id="inputMessage" rows="5" cols="55" onkeypress="if(event.keyCode==13) {send();}"></textarea>
			<input type="submit" value="보내기" onclick="send()" />
		</div>
	</fieldset>
	
	<div id="error" >
		<p>현재 상담 가능하지 않습니다.</p>
		<p>보안 관계로 3초후 창이 닫힙니다.</p>
	</div>
	
	<div id="wait" >
		<p>현재 대기자는 "<strong id="waitnum" ></strong>"명 입니다.</p>
		<p>빠른 상담을위해 최선을 다하겠습니다.</p>
	</div>
	
	<div id="end" >
		<p>상담이 종료되었습니다.</p>
		<p>보안 관계로 3초후 창이 닫힙니다.</p>
	</div>
	
</body>

<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
 
	var webSocket = new WebSocket('ws://127.0.0.1:8787/SemiProjectBeta/broadcasting?seq=<%=dto.getUserinfo_seq()%>');
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
    	
    	if(event.data.indexOf("(SyStEm)EXIT[USER=ALL]")==0){
			$("fieldset").hide();
			$("#error").show();
			setTimeout(function() {
				window.close();
			}, 3000);
		} else if(event.data.indexOf("(SyStEm)EXIT[USER=")==0){//(SyStEm)EXIT[USER=(nickname)]
			$("fieldset").hide();
			$("#end").show();
			setTimeout(function() {
				window.close();
			}, 3000);
		} else if(event.data.indexOf("(SyStEm)WAIT[USER=")==0){//(SyStEm)WAIT[USER=(number)]
			$("fieldset").hide();
			var start = event.data.indexOf("(SyStEm)WAIT[USER=")+18;
			var end = event.data.indexOf("]");
			var waitnum = event.data.substring(start,end);
			$("#waitnum").text(waitnum);
			$("#wait").show();
		} else if(event.data.indexOf("(SyStEm)WAIT[USER--]")==0){
			var waitnum = $("#waitnum").text();
			waitnum = parseInt(waitnum, 10);
			waitnum--;
			if(waitnum<0){
				$("#wait").hide();
				$("fieldset").show();
			} else {
				$("#waitnum").text(waitnum);
			}
		} else {
			textarea.value += "상담원 : "+ event.data + "\n";
		}
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