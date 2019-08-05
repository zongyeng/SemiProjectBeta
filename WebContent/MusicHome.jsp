<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.wholesection{width : 100%; height:1700px; margin-top : 40px;}
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
	
	<section class ="section1"> <!-- 뮤직 탑 10/ 테이블로 (인기음악) -->
		<div class = "section1div">
			<div class = "section1divtablediv" onclick ="location.href('')">
					<p> TOP SONG </p> 
			</div>
			<table class = "section1divtable" border= "1" >
				<colgroup>
					<col width = "10%"> <!-- 앨범이미지 -->
					<col width = "10%"> <!-- 등수 숫자  -->
					<col width = "79%"> <!-- 곡 이름 -->
				</colgroup>
				<thead>
				</thead>
				<tbody> <!-- 10개 까지만 출력 -->
				<% for(int a=1; a<=10; a++) {%>
					<tr height = 100px;>
						<td>앨범사진<%= a %></td>
						<td><%= a %></td>
						<td>곡 이름출력<%= a %></td>
					</tr>
				<%}%>
				</tbody>
			</table>
		</div>
	</section>
	<section class ="section2"> <!-- 신규음악 /추천음악 /장르음악 // 사진3개 일렬로, 누를시 링크이동-->
		<div class = "section2div">
			<div class = "section2divdiv1" >
				<div class = "section2divdivdiv" onclick ="location.href('')"> 
					<p><span>인기 차트 </span></p>
				</div>
			</div>
			<div class = "section2divdiv2">
				<div class = "section2divdivdiv" onclick ="location.href('')"> 
					<p><span>장르 음악 </span></p>
				</div>
			</div>
			<div class = "section2divdiv3">
				<div class = "section2divdivdiv" onclick ="location.href('')"> 
					<p><span>추천 음악 </span></p>
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>