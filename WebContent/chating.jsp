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
</head>

<%
	try{
		chattingDto dto = (chattingDto)request.getAttribute("dto");
		if(dto.getUserinfo_controlno()==0){
			int ConsultantSEQ = dto.getUserinfo_seq();
%>

<body>
	<fieldset>
		<textarea id="messageWindow" rows="10" cols="50" readonly="readonly"></textarea>
		<br/>
		<input id="inputMessage" type="text" onkeypress="if(event.keyCode==13) {send();}" />
		<input type="submit" value="send" onclick="send()" />
	</fieldset>

	<div id="userinfo">
		고유번호<input id="userinfo_seq" type="text" readonly="readonly" /> <br/>
		이름<input id="userinfo_name" type="text" readonly="readonly" /> <br/>
		NickName<input id="userinfo_nickname" type="text" readonly="readonly" /> <br/>
		성별<input id="userinfo_sex" type="text" readonly="readonly" /> <br/>
		번호<input id="userinfo_phon" type="text" readonly="readonly" /> <br/>
		Email<input id="userinfo_email" type="text" readonly="readonly" /> <br/>
		<input id="userexit" type="button" onclick="exit()" value="퇴장" />
	</div>

	<div id="Waiting"></div>

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
		
		if(event.data.indexOf("(SyStEm)USER[NONE]")==0){
			document.getElementById("userinfo_seq").value = "";
			document.getElementById("userinfo_name").value = "";
			document.getElementById("userinfo_nickname").value = "";
			document.getElementById("userinfo_sex").value = "";
			document.getElementById("userinfo_phon").value = "";
			document.getElementById("userinfo_email").value = "";
		} else if(event.data.indexOf("(SyStEm)USER[CHANGE]")==0){
			changeUser();
		} else if(event.data.indexOf("(SyStEm)EXIT[WAIT")==0){
			var startindex = event.data.indexOf("WAIT=")+5;
			var endindex = event.data.indexOf("]");
			
			var nickname = event.data.substring(startindex,endindex);
			var tags = document.getElementsByName("userinfo_nickname");
			console.log(nickname);
			for(var i = 0; tags.length; i++){
				if(tags[i].value == nickname){
					document.getElementById("Waiting").removeChild(waituser[i]);
				}
			}

		}else if(event.data.indexOf("(SyStEm)USER[")==0){//(SyStEm)USER["userinfo"]
			var seqS = event.data.indexOf("[SEQ=")+5;
			var seqE = event.data.indexOf("NAME=")-1;
			var nameS = event.data.indexOf("NAME=")+5;
			var nameE = event.data.indexOf("NICKNAME=")-1;
			var nicknameS = event.data.indexOf("NICKNAME=")+9;
			var nicknameE = event.data.indexOf("SEX=")-1;
			var sexS = event.data.indexOf("SEX=")+4;
			var sexE = event.data.indexOf("PHON=")-1;
			var phonS = event.data.indexOf("PHON=")+5;
			var phonE = event.data.indexOf("EMAIL=")-1;
			var emailS = event.data.indexOf("EMAIL=")+6;
			var emailE = event.data.indexOf("]");
			var seq = event.data.substring(seqS,seqE);
			var name = event.data.substring(nameS,nameE);
			var nickname = event.data.substring(nicknameS,nicknameE);
			var sex = event.data.substring(sexS,sexE);
			var phon = event.data.substring(phonS,phonE);
			var email = event.data.substring(emailS,emailE);
			
			if(document.getElementById("userinfo_seq").value==""||document.getElementById("userinfo_seq").value=="<%=ConsultantSEQ%>"){
				document.getElementById("userinfo_seq").value = seq;
				document.getElementById("userinfo_name").value = name;
				document.getElementById("userinfo_nickname").value = nickname;
				document.getElementById("userinfo_sex").value = sex;
				document.getElementById("userinfo_phon").value = phon;
				document.getElementById("userinfo_email").value = email;
			} else {
				createWaitUser(seq,name,nickname,sex,phon,email);
			}
		} else {
			textarea.value += event.data + "\n";
		} 
	}

	function onOpen(event) {
		textarea.value += "연결 성공\n";
	}

	function onError(event) {
		alert(event.data);
	}

	function send() {
		textarea.value += "상담자------------------\n" + inputMessage.value + "\n" + "---------------------\n";
		webSocket.send(inputMessage.value);
		inputMessage.value = "";
	}
	
	function exit() {
		webSocket.send("(SyStEm)EXIT[USER="+document.getElementById("userinfo_nickname").value+"]");
	}
	
	function createWaitUser(seq,name,nickname,sex,phon,email) {
		var waitnumber = 0;
		var waituser = document.createElement('div');
		waituser.id = ++waitnumber;
		waituser.setAttribute( 'class', 'wait' );
		
		waituser.innerHTML = "<p name = 'userinfo_seq' value='"+seq+"'>"+seq+"</p>";
		
		waituserinfo = document.createElement('input');
		waituserinfo.name = "userinfo_name";
		waituserinfo.type = "hidden";
		waituserinfo.value = name;
		
		waituser.appendChild(waituserinfo);
		
		waituserinfo = document.createElement('input');
		waituserinfo.name = "userinfo_nickname";
		waituserinfo.type = "hidden";
		waituserinfo.value = nickname;
		
		waituser.appendChild(waituserinfo);
		
		waituserinfo = document.createElement('input');
		waituserinfo.name = "userinfo_sex";
		waituserinfo.type = "hidden";
		waituserinfo.value = sex;
		
		waituser.appendChild(waituserinfo);
		
		waituserinfo = document.createElement('input');
		waituserinfo.name = "userinfo_phon";
		waituserinfo.type = "hidden";
		waituserinfo.value = phon;
		
		waituser.appendChild(waituserinfo);
		
		waituserinfo = document.createElement('input');
		waituserinfo.name = "userinfo_email";
		waituserinfo.type = "hidden";
		waituserinfo.value = email;
		
		waituser.appendChild(waituserinfo);
		
		document.getElementById("Waiting").appendChild(waituser);
	}
	
	function changeUser() {
		var waituser = document.getElementsByClassName("wait");
		console.log(waituser.length);
		if(waituser.length==0){
			textarea.value += "대기자가 없습니다." + "\n";
		} else {
			document.getElementById("userinfo_seq").value = waituser[0].childNodes[0].value;
			document.getElementById("userinfo_name").value = waituser[0].childNodes[1].value;
			document.getElementById("userinfo_nickname").value = waituser[0].childNodes[2].value;
			document.getElementById("userinfo_sex").value = waituser[0].childNodes[3].value;
			document.getElementById("userinfo_phon").value = waituser[0].childNodes[4].value;
			document.getElementById("userinfo_email").value = waituser[0].childNodes[5].value;
			document.getElementById("Waiting").removeChild(waituser[0]);
		}
	}

</script>

<%
		} else {
%>
	<body>
		<h1> 관리자 페이지입니다. 접근이 제한됩니다. 잘못된 접근입니다. </h1>
	</body>
<%
		}
	
	} catch (NullPointerException e){
%>		
	<body>
		<h1> 비 로그인시 접근 불가능 합니다. </h1>
	</body>
<%		
	}
%>
</html>