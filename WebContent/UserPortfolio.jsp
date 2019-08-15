<%@page import="semi.dto.AlbumDto"%>
<%@page import="semi.dto.MusicDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	List<MusicDto> usersongs = (List<MusicDto>)request.getAttribute("usersongs");
	List<AlbumDto> useralbums = (List<AlbumDto>)request.getAttribute("useralbums");
	loginDto basicuserinfo = (loginDto)request.getAttribute("basicuserinfo");
%>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js/statistics.js" ></script>
<script type="text/javascript">
	var num=0;
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
	
	
	// 2. This code loads the IFrame Player API code asynchronously.
    var tag = document.createElement('script');

    tag.src = "https://www.youtube.com/iframe_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

    // 3. This function creates an <iframe> (and YouTube player)
    //    after the API code downloads.
    var player;
    function onYouTubeIframeAPIReady() {
      player = new YT.Player('player', {
        height: '360',
        width: '640',
        videoId: '<%=basicuserinfo.getUserinfo_videoid()%>',
        events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
        }
      });
    }

    // 4. The API will call this function when the video player is ready.
    function onPlayerReady(event) {
      event.target.playVideo();
    }

    // 5. The API calls this function when the player's state changes.
    //    The function indicates that when playing a video (state=1),
    //    the player should play for six seconds and then stop.
    var done = false;
    function onPlayerStateChange(event) {
      if (event.data == YT.PlayerState.PLAYING && !done) {
        setTimeout(stopVideo, 6000);
        done = true;
      }
    }
    function stopVideo() {
      player.stopVideo();
    }
</script>
<style type="text/css">
	.wholesection{width : 100%;  margin-top : 40px;}
	.section1 {width:100%; botton : 100px;}
	.section1div {width : 70%;
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
							border-bottom-left-radius:5px;background : rgba(0,0,0,0.6);
							color:white;" onclick="select1()"> Portfolio </button>
					<button id="timeline" onclick="select2()"> Timeline </button>
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
					<p> portfolio </p> 
			</div>
			<table class = "section1divtable" border= "1" >
				<colgroup>
					<col width = "5%"> <!-- 순서-->
					<col width = "15%"> <!-- 앨범이미지  -->
					<col width = "60%"> <!-- 앨범 이름 -->
					<col width = "20%"> <!-- 작곡가 이름 -->
				</colgroup>
				<tr>
					<td colspan="4">
						<p style="font-size:30px;"> portfolio 영상 </p>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<p>닉네임 : <%=basicuserinfo.getUserinfo_nickname()%></p>
						<p>성별 : <%=basicuserinfo.getUserinfo_sex()%></p>
						<p>나이대 : <%=basicuserinfo.getUserinfo_age()%></p>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div id="player"></div>
					</td>
				</tr>
				<tr style="color: rgba(0,0,0,0.6); font-size: 8px;"  height = 30px;>
					<td>순서</td>
					<td>앨범이미지</td>
					<td>앨범이름</td>
					<td>작곡가</td>
				</tr>
				<tbody>
<% 

				for(int i = 0; i<useralbums.size(); i++) {
%> 
					<tr height = 100px;>
						<td><%=useralbums.get(i).getAlbum_no()%></td> <!-- 앨범 순서 알아서 들고오기~ -->
						<td>
							<img alt="앨범이미지<%=useralbums.get(i).getAlbum_no()%>" src="albumimg/<%=useralbums.get(i).getAlbum_seq()%>.png" onerror="this.src='albumimg/albumnoimg.png'" />
						</td>
						<td><%=useralbums.get(i).getAlbum_title()%></td>
						<td><%=basicuserinfo.getUserinfo_nickname()%></td>
					</tr>
<% 
					int k=0;
					for(int j = 0; j<usersongs.size();j++) {
						if(usersongs.get(j).getMusic_album()==useralbums.get(i).getAlbum_seq()){
%>
						<tr height = 30px;>
							<td><%=++k%></td> <!-- 앨범 순서 알아서 들고오기~ -->
							<td colspan="2"><%=usersongs.get(j).getMusic_title().substring(usersongs.get(j).getMusic_title().indexOf('_')+1)%></td>
							<td> 재생버튼 / 플레이리스트에 담기 버튼 / 추천버튼 </td>
						</tr>
<%							
						}
					}
					k=0;
				}
%>

				</tbody>
			</table>
		</div>
	</section>
</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>