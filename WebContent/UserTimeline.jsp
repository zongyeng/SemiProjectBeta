<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String videoid=request.getParameter("videoid");
	int b =1;
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var num=1;
	function select1(){
		document.getElementById("portfolio").style.background="rgba(0,0,0,0.6)";
		document.getElementById("portfolio").style.color = "white";
		document.getElementById("timeline").style.background ="rgba(0,0,0,0)";
		document.getElementById("timeline").style.color = "black";
		document.getElementById("graph").style.background ="rgba(0,0,0,0)";
		document.getElementById("graph").style.color = "black";
		num=0;
	}
	
	function select2(){
		document.getElementById("portfolio").style.background ="rgba(0,0,0,0)";
		document.getElementById("portfolio").style.color = "black";
		document.getElementById("timeline").style.background="rgba(0,0,0,0.6)";
		document.getElementById("timeline").style.color = "white";
		document.getElementById("graph").style.background ="rgba(0,0,0,0)";
		document.getElementById("graph").style.color = "black";
		num=1;
	}
	function select3(){
		document.getElementById("portfolio").style.background ="rgba(0,0,0,0)";
		document.getElementById("portfolio").style.color = "black";
		document.getElementById("timeline").style.background ="rgba(0,0,0,0)";
		document.getElementById("timeline").style.color = "black";
		document.getElementById("graph").style.background="rgba(0,0,0,0.6)";
		document.getElementById("graph").style.color = "white";
		num=2;
	}
	
	function pagemovemove(){

			switch(num){
			case 0 : destination = "portfolio"; break;
			case 1 : destination = "timeline"; break;
			case 2 : destination = "graph"; break;
			}
	}
	
	function search(){
		pagemovemove();
		location.href ="musicgenre.do?command="+destination;
	}
	
</script>
<style type="text/css">
	.wholesection{width : 100%; height:2500px; margin-top : 40px;}
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
	.section2divdiv1 { background-image: url("images/portfoliochartpicture1.jpg");}
	.section2divdiv2 { background-image: url("images/genrepicture1.jpg"); width : 300px; height:300px;}
	.section2divdiv3 { background-image: url("images/graphpicture1.jpg"); width : 300px; height:300px;}
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
	.buttongroupdiv1 button {  width : 32%; height : 40px; 	
				border-style: none;
				border: 1px solid black;
				background-color: rgba(0,0,0,0); color : black; padding : 5px;}
	.buttongroupdiv1 {width : 90%; height: 60px; margin: 0 auto;}
	.buttongroupdiv1 button:hover { background-color: rgba(0,0,0,0.6); color : white; cursor: pointer;}
	.buttongroupdiv3 button {  width : 99%; height : 40px; 	
				border-style: none;
				border: 1px solid black;
				background-color: rgba(0,0,0,0); color : black; padding : 5px;}
	.buttongroupdiv3 button:hover { background-color: rgba(0,0,0,0.6); color : white; cursor: pointer;}
	.buttongroupdiv3 {width : 90%; height: 60px; margin: 0 auto;}
	.txtarea:focus { outline : none; }
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
					<button id="portfolio" style = "border-top-left-radius: 5px;
							border-bottom-left-radius:5px;" 
							onclick="select1()"> Portfolio </button>
					<button id="timeline" onclick="select2()" style="background : rgba(0,0,0,0.6);
							color:white;"> Timeline </button>
					<button id="graph" style="border-bottom-right-radius:5px; 
					border-top-right-radius: 5px;" onclick="select3()">Graph</button>
				</div>
				<div class="buttongroupdiv3">
					<button onclick="search()" 
							style = "border-radius: 5px; ">검색</button>
				</div>
			</div>
		</div>
			<div class = "section1divtablediv" onclick ="location.href('')">
					<p> Timeline </p> 
			</div>
			<div style="border : 1px;">
			<table class = "section1divtable" border= "1" style = "margin-bottom: 50px;" >
				<colgroup>
					<col width = "25%"> <!-- 작성자->
					<col width = "25%"> <!-- 작성자 빈칸  -->
					<col width = "25%"> <!-- 날짜 -->
					<col width = "25%"> <!-- 날짜 빈칸 -->
				</colgroup>
				<tr height = 30px;>
					<td>작성자</td>
					<td>session작성자이름</td> <!--  dto 작성자 이름 -->
					<td>작성날짜</td>
					<td>session작성날짜</td> <!-- dto 오늘날짜 -->
				</tr>
				<tr height = 70px;>
					<td>내용</td>
					<td colspan="3"> <textarea class ="txtarea" rows="5" style="width:95%; border :0; resize:none;"></textarea>
					<input type ="button" value="등록" style="float : right;"/>
					</td>
				</tr>
			<% for(int c=0; c<5; c++) { %> <!-- 댓글 수만큼 돌리기 -->
			</table>
			<table class = "section1divtable" border= "1" style="margin-bottom: 20px;" >
				<colgroup>
					<col width = "25%"> <!-- 작성자->
					<col width = "25%"> <!-- 작성자 빈칸  -->
					<col width = "25%"> <!-- 날짜 -->
					<col width = "25%"> <!-- 날짜 빈칸 -->
				</colgroup>
				<tr height = 30px;>
					<td>작성자</td>
					<td>해당 글 작성자 이름</td> <!--  dto 작성자 이름 -->
					<td>작성날짜</td>
					<td>해당 글 작성 날짜</td> <!-- dto 오늘날짜 -->
				</tr>
				<tr height = 70px;>
					<td>내용</td>
					<td colspan="3"> <!-- 글내용 들어올곳 --></td>
				</tr>
				<tr>
					<td>댓글쓰기</td>
					<td colspan="3"> <textarea class ="txtarea" rows="1" style="width:90%; border :0; resize:none;"></textarea>
					<input type="button" value ="등록" style="float : right;"/></td>
				</tr>
				<% if(b > 0){ %> <!--  댓글이 1개이상일때 -->
				<tr>
					<td colspan="4"> 댓글 </td>
				</tr>
				<%} %>
				<tbody>
				<% for(int a=1; a<=5; a++) {%> <!-- 댓글갯수만큼 돌리기 / 날짜별로 정렬하기-->
					<tr height = 30px;>
						<td>댓글 작성자 이름</td> <!-- -->
						<td colspan="3">댓글 내용 </td>
					</tr>
				<%}%>
				</tbody>
			</table>
			<%}%>
			</div>
		</div>
	</section>
</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>