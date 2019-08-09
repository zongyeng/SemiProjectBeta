<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String youtubeid="";
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var num=0;
	var youtubeid ="";
	function select1(){
		document.getElementById("popular").style.background="rgba(0,0,0,0.6)";
		document.getElementById("popular").style.color = "white";
		document.getElementById("recommand").style.background ="rgba(0,0,0,0)";
		document.getElementById("recommand").style.color = "black";
	}
	
	function select2(){
		document.getElementById("popular").style.background ="rgba(0,0,0,0)";
		document.getElementById("popular").style.color = "black";
		document.getElementById("recommand").style.background ="rgba(0,0,0,0.6)";
		document.getElementById("recommand").style.color = "white";
	}
	function findyoutubeid() {
		window.open("youtube.jsp", "search", 
		"left=0 ,top=0 ,width=screen.availwidth, height=screen.avail.height, history=no, resizable=no, status=no, scrollbars=no");
	}
	
	function selectyoutubeid(youtubeid) {
		alert(youtubeid);
		$(".videoId").val(youtubeid);
	}

</script>
<style type="text/css">
	.wholesection{width : 100%; height:7700px; margin-top : 40px;}
	.section1 {width:100%; height : 1300px;}
	.section1div {width : 70%; height : 1000px;
					margin-left : auto; margin-right : auto;}
	.section1divtable {text-align: center; width : 100%;}
	.section1divtablediv { height : 100px; margin-bottom:30px;
					    	font-size: 20px; border-bottom : 1px solid black;
							border-top : 1px solid black;
							background-image: url("images/top10picture.jpg");
							background-repeat: no-repeat;
							background-position: -300px;
							position: relative; overflow: hidden;}
	.section1divtablediv2 { margin : 0 auto;}	
				
	
	.section1divtablediv:hover {background-color: rgba(255,255,255,0.6);
									cursor : pointer; }							
	.section1divtablediv p {text-align: center; font-size: 30px;
								font-weight:bold; color : white;
								margin-top : 30px; background-color: rgba(0,0,0,0.8);}
	
	.section2 {width:100%; height : 400px;}
	.section2div {width : 70%; height : 400px; margin : 0 auto;
			     display : flex;}
	.section2div div {width : 300px; height:300px;
					display: flex-basis; width : 300px;
				    margin: 0 auto;
				     background-repeat: no-repeat;
					 background-position: -300px;
					 position: relative; overflow: hidden;
					 	border: 1px solid black;}	
	.section2div div:hover { background-color: rgba(255,255,255,0.6);
							cursor : pointer;}	
	.section2divdiv1 { background-image: url("images/popularchartpicture1.jpg");}
	.section2divdiv2 { background-image: url("images/genrepicture1.jpg"); width : 300px; height:300px;}
	.section2divdiv3 { background-image: url("images/recommandpicture1.jpg"); width : 300px; height:300px;}
	.section2divdivdiv { width : 100px; height : 30px;}
	.section2divdivdiv p{ text-align: center; font-size: 30px;
							font-weight:bold; color : white;
							margin-top : 30px; background-color: rgba(0,0,0,0.8);  }
	.asidemenu{ width : calc(13% - 2px); height : 20%;
				background-color: rgb(100,100,100); 
				position: fixed; top : 195px; left:1%;
				border: solid 2px rgba(200,200,200,0.5);
				text-decoration: none;
				}
	.asidemenu ul>li{padding-left : 10px; margin-top : 10px; margin-bottom : 10px; 
					color:#cccccc;}
	.asidemenu ul>li:hover {color:#ffffff; cursor: pointer;}
	.asidemenu ul { text-decoration: none; list-style: none; }
	.buttongroup {height: 50px;}
	.weekbtn {  width : 80px; height : 40px; 
				border-top-left-radius: 5px;
				border-bottom-left-radius:5px;
				border-style: none;
				border: 1px solid black;
				background-color: rgba(0,0,0,0); color : black; padding : 5px;}
	.monthbtn { width : 80px; height : 40px;
				border-top-right-radius: 5px;
				border-bottom-right-radius: 5px;
				border-style: none;
				border: 1px solid black;
				background-color: rgba(0,0,0,0.6); color : white; padding : 5px;
				position : relative; left : -6px;}
	.weekbtn:hover { background-color: rgba(0,0,0,0.6); color : white;  cursor: pointer;}
	.monthbtn:hover {cursor: pointer;}
	
	.buttongroup {height: 120px; margin : 0 auto;}
	.buttongroupdiv1 button {  width : 49%; height : 40px; 	
				border-style: none;
				border: 1px solid black;
				background-color: rgba(0,0,0,0); color : black; padding : 5px;}
	.buttongroupdiv1 {width : 90%; height: 60px; margin: 0 auto;}
	.buttongroupdiv1 button:hover { background-color: rgba(0,0,0,0.6); color : white; cursor: pointer;}
</style>
</head>
<body>	
<%@ include file="./form/header.jsp"%>

<section class ="wholesection">
	<section class ="section1"> 
		<div class = "section1div">
		<div class="buttongroup"> 
			<div class = "buttongroupwrap">
				<div class="buttongroupdiv1">
					<button id="popular" style = "border-top-left-radius: 5px;
							border-bottom-left-radius:5px;background : rgba(0,0,0,0.6);
							color:white;" onclick="select1()"> popular </button>
					<button id="recommand" style="border-bottom-right-radius:5px; 
					border-top-right-radius: 5px;" onclick="select2()">recommand</button>
				</div>
			</div>
		</div>
			<div class = "section1divtablediv" onclick ="location.href('')">
					<p> portfolio </p> 
			</div>
			<div class = "section1divtablediv2">
				<input type="button" onclick="findyoutubeid();" value="영상 등록하기"/>
				<input type="text" class ="videoId" value="" readonly="readonly"/>
			</div>
			
			<table class = "section1divtable" border= "1" >
				<colgroup>
					<col width = "5%"> <!-- 순위-->
					<col width = "15%"> <!-- 앨범이미지  -->
					<col width = "60%"> <!-- 앨범 이름 -->
					<col width = "20%"> <!-- 작곡가 이름 -->
				</colgroup>
				<thead>
					<tr style="color: rgba(0,0,0,0.6); font-size: 8px;"  height = 30px;>
						<td>순위</td>
						<td>앨범이미지</td>
						<td>앨범이름</td>
						<td>작곡가</td>
						
					</tr>
				</thead>
				<tbody>
				<% for(int a=1; a<=10; a++) {%>
					<tr height = 100px;>
						<td><%= a %></td>
						<td>앨범이미지<%= a %></td>
						<td>앨범이름<%= a %></td>
						<td>작곡가<%= a %></td>
					</tr>
				<%}%>
				</tbody>
			</table>
		</div>
	</section>
</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>