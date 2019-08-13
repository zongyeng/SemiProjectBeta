<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

	body>div{
		width : 70%; margin: 0px auto 10px auto; height : auto;
	}
	
	body>div>div>div[id]{
		display: inline-block;
		width: 150px; height: 170px;
		margin: 10px 10px 50px 10px;
	}

	#searchid{
		margin: 50px auto 50px auto;
	}
	
	h1,h2,h3,h4{
		margin: 50px auto 50px auto;
	}

	.line{
		overflow-x: scroll;
		white-space: nowrap
	}
	
	.line::-webkit-scrollbar{
		display:none; 
	}
	
	#artists img, #songs img, #albums img{
		width: 150px; height: 150px;
	}
	
	#artists a, #songs a, #albums a{
		width: 150px; height: 20px;
	}

</style>


</head>
<body>
<%@ include file="./form/header.jsp"%>


	<div id = "searchid" ><strong>"</strong><b id = "searchcontent"></b><strong>" 에 대한 검색내용 입니다.</strong></div>

	<div id="artists" >
	
		<h3>아티스트 검색 결과</h3>
		
		<div class="line">
			<div id = "artists i " >
				<img alt="artistimg i " src="artistimg/?.jpg">
				<a href=""></a>
			</div>
			<div id = "artists i " >
				<img alt="artistimg i " src="artistimg/?.jpg">
				<a href=""></a>
			</div>
			<div id = "artists i " >
				<img alt="artistimg i " src="artistimg/?.jpg">
				<a href=""></a>
			</div>
			<div id = "artists i " >
				<img alt="artistimg i " src="artistimg/?.jpg">
				<a href=""></a>
			</div>
			<div id = "artists i " >
				<img alt="artistimg i " src="artistimg/?.jpg">
				<a href=""></a>
			</div>
			<div id = "artists i " >
				<img alt="artistimg i " src="artistimg/?.jpg">
				<a href=""></a>
			</div>
		</div>
		
		<div>검색결과 : <strong id="searchnum" ></strong>개</div>
		
		<h4>"검색 결과가 없습니다."</h4>
		
	</div>
	
	<div id="songs" >
		<h3>노래 검색 결과</h3>
		
		<div class="line">
			<div id = "songs i " >
				<img alt="songimg i " src="musicimg/?.jpg">
				<a href=""></a>
			</div>
		</div>
		
		<div>검색결과 : <strong id="searchnum" ></strong>개</div>
		
		<h4>"검색 결과가 없습니다."</h4>
		
	</div>
	
	<div id="albums" >
		<h3>앨범 검색 결과</h3>
		
		<div class="line">
			<div id = "albums i " >
				<img alt="albumimg i " src="albumimg/?.jpg">
				<a href=""></a>
			</div>
		</div>
		
		<div>검색결과 : <strong id="searchnum" ></strong>개</div>
		
		<h4>"검색 결과가 없습니다."</h4>
	
	</div>

<%@ include file="./form/footer.jsp"%>
</body>
</html>