<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/chatting.js" ></script>
<script type="text/javascript">
$(function(){
	$(".section1div2div2div1divdiv1").each(function(){
		$(this).css("height",function(){
			return $(this).width();
		});
	})
	
	$(".section2div2div2div1divdiv1").each(function(){
		$(this).css("height",function(){
			return $(this).width();
		});
	})
})	
</script>
<style type="text/css">
	.section1 { width : 100%; height : 800px;}
	.section1div1div { width : 100%; height: 100px; color : white;
					font-size: 30px; text-align: center; padding-top: 50px;
					font-weight: bold;}
	.section1div2 { width : 70%; height :600px; margin:20px auto;}
	.section1div2div1 { width : 100%; height: 50px; color : black;
					font-size: 30px; text-align: center; padding-top: 10px;
					font-weight: bold; display : table;} 
	.section1div2div1div {display: table-cell; vertical-align: middle;
						border-top: 2px groove gray; border-bottom:2px double gray;}
	.section1div2div2div1divdiv1:hover { cursor : pointer; }
	.section1div2div2 {width : 100%; height :600px; margin:20px auto;}
	.section1div2div2div1 { display : flex; }
	.section1div2div2div1div { display : flex-basis; width : calc(50% - 2px);
								border : solid 1px;}
	.section1div2div2div1divdiv1 { width : 95%; height: 190px; margin : 0 auto; border : solid 1px;}
	.section1div2div2div1divdiv2 { width : 100%; height: 50px;text-align : center; font-size : 30px;
	 magin-top:5px;}
								
</style>
</head>
<body>
<%@ include file="./form/header.jsp"%>
<%

	loginDto userinfoService = (loginDto)session.getAttribute("userdto");

	if(userinfoService==null){
%>
	
	<input type="hidden" id="controlno" value="" />
	<input type="hidden" id="seq" value="" />
		
<%		
	} else {
%>
	<input type="hidden" id="controlno" value="<%=userinfoService.getUserinfo_controlno() %>" />
	<input type="hidden" id="seq" value="<%=userinfoService.getUserinfo_seq() %>" />
<%
	}
%>

<section class = "section1">
	<div class = "section1div2">
		<div class = "section1div2div1">
			<div class = "section1div2div1div">
			<span> ServiceCenter </span>
			</div>
		</div>
		<div class = "section1div2div2">
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img onclick="supportchat()" src="images/ServiceCenterOnetooneChatting.jpg" width="100%" alt ="1:1 상담하기"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span> 1:1 상담하기 </span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img onclick="window.open('chatbotres.jsp', 'search', 'top=100px, left=100px, height=500px, width=400px')" src="images/ServiceCenterChattingRobot.jpg" width="100%" alt ="챗봇"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span> 챗봇</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="./form/footer.jsp"%>
</body>
</html>