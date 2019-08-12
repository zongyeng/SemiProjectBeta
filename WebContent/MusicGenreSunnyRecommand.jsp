<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SunnyRecommand</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/genre.js" ></script>
<script type="text/javascript">
var pr=1; var num=1;
</script>
<link href="resources/genre.css" rel="stylesheet" type="text/css">
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
					<button id="ganre0" style = "border-top-left-radius: 5px;
							border-bottom-left-radius:5px; "onclick="ganre0()">all</button>
					<button id="ganre1" onclick="ganre1()"
							style = "background : rgba(0,0,0,0.6);
							color:white;">sun</button>
					<button id="ganre2" onclick="ganre2()">cloud</button>
					<button id="ganre3" onclick="ganre3()">rain</button>
					<button id="ganre4" onclick="ganre4()">storm</button>
					<button id="ganre5" onclick="ganre5()">snow</button>
					<button id="ganre6" style="border-bottom-right-radius:5px; 
					border-top-right-radius: 5px;" onclick="ganre6()">wind</button>
				</div>
				<div class="buttongroupdiv3">
					<button id="ganre0" onclick="search()" 
							style = "border-radius: 5px; ">검색</button>
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