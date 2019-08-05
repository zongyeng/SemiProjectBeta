<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wholesection{width : 100%; height:7700px; margin-top : 40px;}
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
	.buttongroupdiv2 {float : left; width : 170px; height: 40px;}
</style>
</head>
<body>	
<%@ include file="./form/header.jsp"%>
<aside class = "asidemenu">
		<ul>
			<li onclick="loction.href=''"> TOP100</li>
			<li onclick="loction.href=''"> 장르별 음악</li>
			<li onclick="loction.href=''"> 인기 음악</li>
			<li onclick="loction.href=''"> 추천 음악</li>		
		</ul>
	</aside>
<section class ="wholesection">
	<section class ="section1"> <!-- 뮤직 탑 100/ 테이블로 (인기음악) -->
		<div class = "section1div">
		<h1>100개 한번에 보여줄지 페이징 쓸지 고민할것</h1>
		<div class="buttongroup"> 
			<div class = "buttongroupwrap">
				<div class="buttongroupdiv2">
					<button class="weekbtn">주간</button>
					<button class="monthbtn">월간</button>
				</div>
			</div>
		</div>
			<div class = "section1divtablediv" onclick ="location.href('')">
					<p> 뮤즈 차트 </p> 
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
				<% for(int a=1; a<=100; a++) {%>
					<tr height = 70px;>
						<td>순위<%= a %></td>
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