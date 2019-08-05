<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	var num=0;
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
	function ganre0(){
		num=0;
		ganre();
	}
	function ganre1(){
		num=1;
		ganre();
	}
	function ganre2(){
		num=2;
		ganre();
	}
	function ganre3(){
		num=3;
		ganre();
	}
	function ganre4(){
		num=4;
		ganre();
	}
	function ganre5(){
		num=5;
		ganre();
	}
	function ganre6(){
		num=6;
		ganre();
	}
	
	
	function ganre(){
		for(var a=0;a<=6;a++){
		document.getElementById("ganre"+a).style.color="black";
		document.getElementById("ganre"+a).style.background ="rgba(0,0,0,0)";	
		}
		document.getElementById("ganre"+num).style.background = "rgba(0,0,0,0.6)";
		document.getElementById("ganre"+num).style.color = "white";
	}

</script>
<style type="text/css">
	.wholesection{width : 100%; height:1500px; margin-top : 40px;}
	.section1 {width:100%; height : 1300px;}
	.section1div {width : 70%; height : 1000px;
					margin-left : auto; margin-right : auto;}
	.section1divtable {text-align: center; width : 100%;}
	.section1divtablediv {  height : 100px; margin-bottom:30px;
								font-size: 20px; border-bottom : 1px solid black;
								border-top : 1px solid black;
								background-image: url("images/top10picture.jpg");
								background-repeat: no-repeat;
								background-position: -300px;
								position: relative; overflow: hidden;}
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
	.buttongroup {height: 120px; margin : 0 auto;}
	.buttongroupdiv1 button {  width : 49%; height : 40px; 	
				border-style: none;
				border: 1px solid black;
				background-color: rgba(0,0,0,0); color : black; padding : 5px;}
	.buttongroupdiv1 {width : 90%; height: 60px; margin: 0 auto;}
	.buttongroupdiv1 button:hover { background-color: rgba(0,0,0,0.6); color : white; cursor: pointer;}
	.buttongroupdiv2 button {  width : 13.66%; height : 40px; 	
				border-style: none;
				border: 1px solid black;
				background-color: rgba(0,0,0,0); color : black; padding : 5px;}
	.buttongroupdiv2 button:hover { background-color: rgba(0,0,0,0.6); color : white; cursor: pointer;}
	.buttongroupdiv2 {width : 90%; height: 60px; margin: 0 auto;}
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
							border-bottom-left-radius:5px;" onclick="select1()"> popular </button>
					<button id="recommand" style="border-bottom-right-radius:5px; 
					border-top-right-radius: 5px; background : rgba(0,0,0,0.6);
							color:white;" onclick="select2()">recommand</button>
				</div>
				<div class="buttongroupdiv2">
					<button id="ganre0" onclick="ganre0()" 
							style = "border-top-left-radius: 5px;
							border-bottom-left-radius:5px;">all</button>
					<button id="ganre1" onclick="ganre1()">sun</button>
					<button id="ganre2" onclick="ganre2()" 
							style ="background : rgba(0,0,0,0.6);
							color:white;">cloud</button>
					<button id="ganre3" onclick="ganre3()">rain</button>
					<button id="ganre4" onclick="ganre4()">storm</button>
					<button id="ganre5" onclick="ganre5()">snow</button>
					<button id="ganre6" style="border-bottom-right-radius:5px; 
					border-top-right-radius: 5px;" onclick="ganre6()">wind</button>
				</div>
			</div>
		</div>
			<div class = "section1divtablediv" onclick ="location.href('')">
					<p> MUTES 차트 </p> 
			</div>
			<table class = "section1divtable" border= "1" >
				<colgroup>
					<col width = "4%"> <!-- 순위-->
					<col width = "10%"> <!-- 앨범이미지  -->
					<col width = "60%"> <!-- 곡 이름 -->
					<col width = "10%"> <!-- 작곡가 이름 -->
					<col width = "10%"> <!-- 앨범 이름 -->
					<col width = "2%"> <!-- 재생 버튼 -->
					<col width = "2%"> <!-- 담기 버튼 -->
					<col width = "2%"> <!-- 좋아요 버튼 -->
				</colgroup>
				<thead>
					<tr style="color: rgba(0,0,0,0.6); font-size: 8px;"  height = 30px;>
						<td>순위</td>
						<td>앨범이미지</td>
						<td>곡</td>
						<td>작곡가</td>
						<td>앨범이름</td>
						<td>재생</td>
						<td>담기</td>
						<td>♡</td>
					</tr>
				</thead>
				
				<tbody> <!-- 100개 까지만 출력 -->
				<% for(int a=1; a<=10; a++) {%>
					<tr height = 70px;>
						<td><%= a %></td>
						<td>앨범이미지<%= a %></td>
						<td>곡 이름출력<%= a %></td>
						<td>작곡가이름<%= a %></td>
						<td>앨범이름<%= a %></td>
						<td>재생</td>
						<td>담기</td>
						<td>좋아</td>
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