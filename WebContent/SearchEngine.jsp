<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>

<style type="text/css">

	body>div{
		width : 70%; margin: 0px auto 10px auto; height : auto;
	}
	
	body>div>div>div[id]{
		display: inline-block;
		width: 150px; height: 170px;
		margin: 10px 10px 50px 10px;
	}
	
	.more{
		display: inline-block;
		height: 170px;
		margin: 0px auto;
		text-align: center;
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
			<div class = "more" onclick="artistsmore()" >더보기...</div>
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
			<div class = "more" onclick="songsmore()" >더보기...</div>
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
			<div class = "more" onclick="albumsmore()" >더보기...</div>
		</div>
		
		<div>검색결과 : <strong id="searchnum" ></strong>개</div>
		
		<h4>"검색 결과가 없습니다."</h4>
	
	</div>

<%@ include file="./form/footer.jsp"%>

<script type="text/javascript">



	$(function(){
		$(".line").on('mousewheel', function(e){
			if(e.originalEvent.wheelDelta==120){
				this.scrollLeft -=30;
				if(this.scrollLeft>1){
					e.preventDefault();
				}
			} else if(e.originalEvent.wheelDelta==-120){
				this.scrollLeft +=30;
				if(this.scrollWidth>(this.scrollLeft+(window.innerWidth*7/10))){
					e.preventDefault();
				}
			}
		});
	});
	
	function artistsmore(){
		$("#artists>.line>.more").text("불러오는중...");
		$.ajax({
			type : 'get',
			url : 'SearchEngine.do?command=artistsmore',
			dataType : 'json',
			success : function(data) {
				$("#artists>.line>.more").remove();
				
				$("#artists>.line").append("<div id = 'artists i ' ><img alt='artistimg i ' src='artistimg/?.jpg'><a href=''></a></div>");
				
				$("#artists>.line").append("<div class = 'more' onclick='more()' >더보기...</div>");
				
				
			}, error : function(error){
				$("#artists>.line>.more").remove();
				$("#artists>.line").append("<div class = 'more' onclick='' >실패했습니다.</div>");
			}
		});
	}
	function songsmore(){
		$("#songs>.line>.more").text("불러오는중...");
		$.ajax({
			type : 'get',
			url : 'SearchEngine.do?command=songsmore',
			dataType : 'json',
			success : function(data) {
				$("#songs>.line>.more").remove();
				
				$("#songs>.line").append("<div id = 'artists i ' ><img alt='artistimg i ' src='artistimg/?.jpg'><a href=''></a></div>");
				
				$("#songs>.line").append("<div class = 'more' onclick='more()' >더보기...</div>");
				
				
			}, error : function(error){
				$("#songs>.line>.more").remove();
				$("#songs>.line").append("<div class = 'more' onclick='' >실패했습니다.</div>");
			}
		});
	}
	function albumsmore(){
		$("#albums>.line>.more").text("불러오는중");
		$.ajax({
			type : 'get',
			url : 'SearchEngine.do?command=albumsmore',
			dataType : 'json',
			success : function(data) {
				$("#albums>.line>.more").remove();
				
				$("#albums>.line").append("<div id = 'artists i ' ><img alt='artistimg i ' src='artistimg/?.jpg'><a href=''></a></div>");
				
				$("#albums>.line").append("<div class = 'more' onclick='more()' >더보기...</div>");
				
				
			}, error : function(error){
				$("#albums>.line>.more").remove();
				$("#albums>.line").append("<div class = 'more' onclick='' >실패했습니다.</div>");
			}
		});
	}
	
	
</script>
</body>
</html>