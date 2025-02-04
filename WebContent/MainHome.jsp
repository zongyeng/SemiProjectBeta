<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi.dto.MusicDto"%>
<%@page import="semi.biz.MusicBiz"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<% 
String Musicname = "";
MusicDto dto = new MusicDto();
MusicBiz biz = new MusicBiz();
List<MusicDto> list = biz.selectList_music();

for(int a=0; a<list.size(); a++) {
	String artist_name = biz.artist_name(list.get(a).getMusic_seq());
	list.get(a).setArtist_name(artist_name);
	System.out.println(list.get(a).getArtist_name());
}
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".section1div2div2div1divdiv1").each(function(){
		$(this).css("height",function(){
			return $(this).width();
		});
		$(this).children("img").css("width",function(){
			return $(this).width();
		});
		
	})
	
	$(".section2div2div2div1divdiv1").each(function(){
		$(this).css("height",function(){
			return $(this).width();
		});
		$(this).children("img").css("height",function(){
			return $(this).children("img").width();
		});
	})
	
	$(".section1div2div2div1div").click(function(){
	var name = $(this).children(".section1div2div2div1divdiv2").children().html();
	$("#throwmusic").val(name);
	var openwin = window.open('audio4.jsp', 'search', 'top=100px, left=100px, height=80px, width=320px');
	}) 

})
</script>
<style type="text/css">
	.section1 { width : 100%; height : 1500px;}
	.section1div1 { width : 70%; height :600px; margin:0 auto;
					 background-image:url("images/musicpicture2.jpg");
					 background-repeat: no-repeat;
					 background-position: -400px;
					 position: relative; overflow: hidden;}
	.section1div1div { width : 100%; height: 100px; color : white;
					font-size: 30px; text-align: center; padding-top: 50px;
					font-weight: bold;}
	.section1div2 { width : 70%; height :600px; margin:20px auto;}
	.section1div2div1 { width : 100%; height: 50px; color : black;
					font-size: 30px; text-align: center; padding-top: 10px;
					font-weight: bold; display : table;} 
	.section1div2div1div {display: table-cell; vertical-align: middle;
						border-top: 2px groove gray; border-bottom:2px double gray;}
	.section1div2div2 {width : 100%; height :600px; margin:20px auto;}
	.section1div2div2div1 { display : flex; }
	.section1div2div2div1div { display : flex-basis; width : calc(20% - 2px);
								border : solid 1px;}
	.section1div2div2div1div:hover {cursor : poi}
	.section1div2div2div1divdiv1 { width : 95%; height: 190px; margin : 0 auto; border : solid 1px;}
	.section1div2div2div1divdiv2 { width : 95%; height: 30px;text-align : center;
	 magin-top:5px;}
	
	.section2 { width : 100%; height : 1500px;}
	.section2div1 { width : 70%; height :600px; margin:0 auto;
					 background-image:url("images/braodcastpicture1.jpg");
					 background-repeat: no-repeat;
					 background-position: -400px;
					 position: relative; overflow: hidden;}
	.section2div1div { width : 100%; height: 100px; color : white;
					font-size: 30px; text-align: center; padding-top: 50px;
					font-weight: bold;}
	.section2div2 { width : 70%; height :600px; margin:20px auto;}
	.section2div2div1 { width : 100%; height: 50px; color : black;
					font-size: 30px; text-align: center; padding-top: 10px;
					font-weight: bold; display : table;} 
	.section2div2div1div {display: table-cell; vertical-align: middle;
						border-top: 2px groove gray; border-bottom:2px double gray;}
	.section2div2div2 {width : 100%; height :600px; margin:20px auto;}
	.section2div2div2div1 { display : flex; }
	.section2div2div2div1div { display : flex-basis; width : calc(20% - 2px); ;
								border : solid 1px;}
	.section2div2div2div1divdiv1 { width : 95%; height: 190px; margin : 0 auto; border : solid 1px;}
	.section2div2div2div1divdiv2 { width : 95%; height: 30px;text-align : center; magin-top:5px;}
	.section2div2div2div1divdiv3 { width : 95%; height: 160px;margin : 0 auto; text-align : center; overflow: hidden;}		
						
</style>
</head>
<body>
<%@ include file="./form/header.jsp"%>
<section class = "section1">
	<div class = "section1div1">
		<div class = "section1div1div">
			<span> 여러분의 음악을 공유하세요! </span>
		</div>
	</div>
	<div class = "section1div2">
		<div class = "section1div2div1">
			<div class = "section1div2div1div">
			<span> 음악 top10 </span>
			</div>
		</div>
		<div class = "section1div2div2">
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div" >
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(0).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(0).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(1).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(1).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(2).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(2).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(3).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(3).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(4).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(4).getMusic_title()%></span>
					</div>
				</div>
			</div>
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(5).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(5).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(6).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(6).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(7).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(7).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(8).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(8).getMusic_title()%></span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="musicimg/album_<%=list.get(9).getMusic_seq()%>.jpg" style="width: 100%; height:inherit;">
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span><%=list.get(9).getMusic_title()%></span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<section class = "section2">
	<div class = "section2div1">
		<div class = "section2div1div">
			<span> 직접 방송으로 연주를 즐겨보세요! </span>
		</div>
	</div>
	<div class = "section2div2">
		<div class = "section2div2div1">
			<div class = "section2div2div1div">
			<span> 방송 top10 </span>
			</div>
		</div>
		<div class = "section2div2div2">
			<div class = "section2div2div2div1">
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송1"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목1</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송2"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목2</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송3"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목3</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송4"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목4</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송5"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목5</span>
					</div>
				</div>
			</div>
			<div class = "section2div2div2div1">
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송6"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목6</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송7"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목7</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송8"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목8</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송9"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목9</span>
					</div>
				</div>
				<div class = "section2div2div2div1div">
					<div class = "section2div2div2div1divdiv1">
						<img src="" alt ="방송10"/>
					</div>
					<div class = "section2div2div2div1divdiv2">
						<span>방송 제목10</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<input id ="throwmusic" type ="hidden" value="123"/>
<%@ include file="./form/footer.jsp"%>
</body>
</html>