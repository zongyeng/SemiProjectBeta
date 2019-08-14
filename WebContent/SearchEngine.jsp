<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="semi.dto.SearchEngineDto"%>
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
		text-align: center;
	}
	
	body>div>div>div[id]>img,body>div>div>div[id]>a{
		display: block;
	}
	
	.more{
		display: inline-block;
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

<%
	List<SearchEngineDto> searchartist = (List<SearchEngineDto>)request.getAttribute("searchartist");
	List<SearchEngineDto> searchmusic = (List<SearchEngineDto>)request.getAttribute("searchmusic");
	List<SearchEngineDto> searchalbum = (List<SearchEngineDto>)request.getAttribute("searchalbum");
	String searchcontent = (String)request.getAttribute("searchcontent");
%>

<body>
<%@ include file="./form/header.jsp"%>

<%
if(searchcontent.length()<2){
%>
	<div id = "searchid" ><strong>"</strong><b id = "searchcontent"><%=searchcontent%></b><strong>"는 검색할 수 없습니다. 두글자 이상 검색해 주세요.</strong></div>
<%
}else{
%>
	<div id = "searchid" ><strong>"</strong><b id = "searchcontent"><%=searchcontent%></b><strong>" 에 대한 검색내용 입니다.</strong></div>

	<div id="artists" >
	
		<h3>아티스트 검색 결과</h3>
<% 
	if(searchartist.size()==0){
%>
		<h4>"검색 결과가 없습니다."</h4>
<%
	} else {
%>
		<div class="line">
<%
		for(int i = 0; i<searchartist.size(); i++){
%>
			<div id = "artists<%=i%>" >
<%
			File f = new File("C:\\Workspace_Semi2\\SemiProjectBeta\\WebContent\\artistimg\\"+searchartist.get(i).getUserinfo_seq()+".png");
			if(!f.isFile()){
%>
				<img alt="artistimg<%=i%>" src="artistimg/artistnoimg.png">
<%
			} else {
%>
				<img alt="artistimg<%=i%>" src="artistimg/<%=searchartist.get(i).getUserinfo_seq()%>.png">
<%
			}
%>
				<a href=""><%=searchartist.get(i).getUserinfo_nickname()%></a>
			</div>
<%
			if(i==9){
%>
			<div class = "more" onclick="artistsmore()" title="1" >더보기...</div>
<%
				break;
			}
		}
%>
		</div>
		
		<div>검색결과 : <strong id="searchnum" ><%=searchartist.size()%></strong>개</div>
		
<%
	}
%>	
	</div>
	
	<div id="songs" >
	
		<h3>노래 검색 결과</h3>		
<% 
	if(searchmusic.size()==0){
%>
		<h4>"검색 결과가 없습니다."</h4>
<%
	} else {
%>	
		<div class="line">
<%
		for(int i = 0; i<searchmusic.size(); i++){
%>		
			<div id = "songs<%=i%>" >
<%
			File f = new File("C:\\Workspace_Semi2\\SemiProjectBeta\\WebContent\\musicimg\\"+searchmusic.get(i).getMusic_seq()+".png");
			if(!f.isFile()){
%>
				<img alt="songimg<%=i%>" src="musicimg/musicnoimg.png">
<%
			} else {
%>				
				<img alt="songimg<%=i%>" src="musicimg/<%=searchmusic.get(i).getMusic_seq()%>.png">
<%
			}
%>
				<a href=""><%=searchmusic.get(i).getMusic_title().substring(searchmusic.get(i).getMusic_title().indexOf('_')+1)%></a>
			</div>
<%
			if(i==9){
%>
			<div class = "more" onclick="songsmore()" title="1" >더보기...</div>
<%
				break;
			}
		}
%>
		</div>
		
		<div>검색결과 : <strong id="searchnum" ><%=searchmusic.size()%></strong>개</div>
<%
	}
%>		
	</div>
	
	<div id="albums" >
	
		<h3>앨범 검색 결과</h3>
<% 
	if(searchalbum.size()==0){
%>
		<h4>"검색 결과가 없습니다."</h4>
<%
	} else {
%>			
		<div class="line">
<%
		for(int i = 0; i<searchalbum.size(); i++){
%>		
			<div id = "albums<%=i%>" >
<%
			File f = new File("C:\\Workspace_Semi2\\SemiProjectBeta\\WebContent\\musicimg\\"+searchalbum.get(i).getAlbum_seq()+".png");
			if(!f.isFile()){
%>
				<img alt="albumimg<%=i%>" src="albumimg/albumnoimg.png">
<%
			} else {
%>
				<img alt="albumimg<%=i%>" src="albumimg/<%=searchalbum.get(i).getAlbum_seq()%>.png">
<%
			}
%>				
				<a href=""><%=searchalbum.get(i).getAlbum_title()%></a>
			</div>
<%
			if(i==9){
%>
			<div class = "more" onclick="albumsmore()" title="1" >더보기...</div>
<%
				break;
			}
		}
%>
		</div>
		
		<div>검색결과 : <strong id="searchnum" ><%=searchalbum.size()%></strong>개</div>
<%
	}
%>
	</div>
<%
}
%>
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
		
		var num = $(".more").prop("title");
		
		$("#artists>.line>.more").text("불러오는중...");
		
		
		if(num==1){
			$.ajax({
				type : 'get',
				url : 'SearchEngine.do?command=artistsmore&searchcontent=<%=searchcontent%>&num='+num,
				dataType : 'json',
				success : function(data) {
					
					$("#artists>.line>.more").remove();
					
					for(var i=0; i<5; i++){
						$("#artists>.line").append("<div id = 'artists"+(i+10)+"' ><img alt='artistimg"+(i+10)+"' src='artistimg/"+data[i+10].artistseq+".png' onerror='this.src=\"artistimg/artistnoimg.png\"' ><a href=''>"+data[i+10].artistnickname+"</a></div>");
					}
					
					artistdataArr = data;
					
					if(data.length>5){
						num++;
						$("#artists>.line").append("<div class = 'more' onclick='artistsmore()' title='"+num+"' >더보기...</div>");
					} else {
						$("#artists>.line").append("<div class = 'more' onclick='' title='' >끝</div>");
					}
				
				}, error : function(error){
					$("#artists>.line>.more").remove();
					$("#artists>.line").append("<div class = 'more' onclick='' >실패했습니다.</div>");
				}
			});
		
		}else{
			var divseq = 5*(1+Number(num));
			
			$("#artists>.line>.more").remove();
			for(var i=(divseq); i<(divseq+5); i++){
				$("#artists>.line").append("<div id = 'artists"+(i)+"' ><img alt='artistimg"+(i)+"' src='artistimg/"+artistdataArr[i].artistseq+".png' onerror='this.src=\"artistimg/artistnoimg.png\"' ><a href=''>"+artistdataArr[i].artistnickname+"</a></div>");
				if((i+1)==artistdataArr.length){
					break;
				}
			}
			
			if((divseq+5)<artistdataArr.length){
				num++;
				$("#artists>.line").append("<div class = 'more' onclick='artistsmore()' title='"+num+"' >더보기...</div>");
			} else {
				$("#artists>.line").append("<div class = 'more' onclick='' title='' >끝</div>");
			}
			
		}
	}
	
	function songsmore(){
		
		var num = $("#songs>.line>.more").prop("title");
		
		$("#songs>.line>.more").text("불러오는중...");
		
		if(num==1){
			$.ajax({
				type : 'get',
				url : 'SearchEngine.do?command=songsmore&searchcontent=<%=searchcontent%>&num='+num,
				dataType : 'json',
				success : function(data) {
					
					$("#songs>.line>.more").remove();
					
					for(var i=0; i<5; i++){
						$("#songs>.line").append("<div id = 'songs"+(i+10)+"' ><img alt='songimg"+(i+10)+"' src='musicimg/"+data[i+10].songseq+".png' onerror='this.src=\"musicimg/musicnoimg.png\"' ><a href=''>"+data[i+10].songtitle+"</a></div>");
					}
				
					songdataArr = data;
					
					if(data.length>5){
						num++;
						$("#songs>.line").append("<div class = 'more' onclick='songsmore()' title='"+num+"' >더보기...</div>");
					} else {
						$("#songs>.line").append("<div class = 'more' onclick='' title='' >끝</div>");
					}
				
				}, error : function(error){
					$("#songs>.line>.more").remove();
					$("#songs>.line").append("<div class = 'more' onclick='' >실패했습니다.</div>");
				}
			});
		
		}else{
			var divseq = 5*(1+Number(num));
			
			$("#songs>.line>.more").remove();
			for(var i=(divseq); i<(divseq+5); i++){
				$("#songs>.line").append("<div id = 'songs"+(i)+"' ><img alt='songimg"+(i)+"' src='musicimg/"+songdataArr[i].songseq+".png' onerror='this.src=\"musicimg/musicnoimg.png\"' ><a href=''>"+songdataArr[i].songtitle+"</a></div>");
				if((i+1)==songdataArr.length){
					break;
				}
			}
			
			if((divseq+5)<songdataArr.length){
				num++;
				$("#songs>.line").append("<div class = 'more' onclick='songsmore()' title='"+num+"' >더보기...</div>");
			} else {
				$("#songs>.line").append("<div class = 'more' onclick='' title='' >끝</div>");
			}
			
		}
	}
	
	function albumsmore(){
		
		var num = $("#albums>.line>.more").prop("title");
		
		$("#albums>.line>.more").text("불러오는중");
		
		if(num==1){
			$.ajax({
				type : 'get',
				url : 'SearchEngine.do?command=albumsmore&searchcontent=<%=searchcontent%>&num='+num,
				dataType : 'json',
				success : function(data) {
					
					$("#albums>.line>.more").remove();
					
					for(var i=0; i<5; i++){
						$("#albums>.line").append("<div id = 'albums"+(i+10)+"' ><img alt='albumimg"+(i+10)+"' src='albumimg/"+data[i+10].albumseq+".png' onerror='this.src=\"albumimg/albumnoimg.png\"' ><a href=''>"+data[i+10].arbumtitle+"</a></div>");
					}
					
					albumdataArr = data;
					
					if(data.length>5){
						num++;
						$("#albums>.line").append("<div class = 'more' onclick='albumsmore()' title='"+num+"' >더보기...</div>");
					} else {
						$("#albums>.line").append("<div class = 'more' onclick='' title='' >끝</div>");
					}
				
				}, error : function(error){
					$("#albums>.line>.more").remove();
					$("#albums>.line").append("<div class = 'more' onclick='' >실패했습니다.</div>");
				}
			});
		
		}else{
			var divseq = 5*(1+Number(num));
			
			$("#albums>.line>.more").remove();
			for(var i=(divseq); i<(divseq+5); i++){
				$("#albums>.line").append("<div id = 'albums"+(i)+"' ><img alt='albumimg"+(i)+"' src='albumimg/"+albumdataArr[i].albumseq+".png' onerror='this.src=\"albumimg/albumnoimg.png\"' ><a href=''>"+albumdataArr[i].arbumtitle+"</a></div>");
				if((i+1)==albumdataArr.length){
					break;
				}
			}
			
			if((divseq+5)<albumdataArr.length){
				num++;
				$("#albums>.line").append("<div class = 'more' onclick='albumsmore()' title='"+num+"' >더보기...</div>");
			} else {
				$("#albums>.line").append("<div class = 'more' onclick='' title='' >끝</div>");
			}
			
		}
	}
	
	
</script>
</body>
</html>