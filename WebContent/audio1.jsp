<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% request.setCharacterEncoding("UTF-8"); %>
    <% response.setContentType("text/html; charset=UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//code.jquery.com/jquery.min.js"></script>	
<script type="text/javascript">

	var segEnd;
	//var myAudio=document.getElementById('myaudio');
	
$(function(){
	
/*	$('#playlist li').on("click",function(e){	// 새로 추가된 리스트는 click이 안 됨
        alert("?");
		e.preventDefault();

		$(this).addClass('active').siblings().removeClass('active');
        
        var music = this.getAttribute('data-value');
		console.log(music);
		
        $('#myaudio source').attr('src', music);
        $("#myaudio")[0].load();
		$("#myaudio")[0].play();
    });
*/	
	var myAudio=document.getElementById('myaudio');
	myAudio.addEventListener("ended", function() {

		index = $('#playlist li').index($('#playlist li[class=active]'));
		index++;
		//console.log('length:'+$('#playlist li').length);
		if(index > $('#playlist li').length-1) index=0;
		console.log( index + '번째 소스 재생' );

		$('#playlist li:eq('+index+')').addClass('active').siblings().removeClass('active');

		//var tmp = $('#playlist li[class=active]');
		var music = $('#playlist li[class=active]').attr('data-value');
		//var tmp1 = $('#playlist li:eq('+index+')');
		//var music1 = tmp1.attr('data-value');
		console.log(music);
		$('#myaudio source').attr('src', music);
		$("#myaudio")[0].load();
		// if not login setSegment(startTime, endTime);		// 구간재생 설정
        // else resetSegment();
		$("#myaudio")[0].play();
	});
	
	myAudio.addEventListener("timeupdate", function (){
		if (segEnd != 0 && myAudio.currentTime >= segEnd) {
			myAudio.pause();
			//var duration = myAudio.duration;
			//var duration = Math.floor(myAudio.duration);
			//console.log("duration:"+duration);
			//setSegment(0,duration);
			
		}  
		//myaudio.currentTime = 0;
		//segEnd = 0;
		//console.log(myAudio.currentTime);
	}, false);
	
});

function setSegment(startTime, endTime){
	if(endTime > startTime) {
		var myaudio = document.getElementById("myaudio");
		//var myaudio = $("#myaudio");
		segEnd = endTime;
		myaudio.currentTime = startTime;
		console.log(myaudio.currentTime, segEnd);
		//myaudio.play();
	} else {
		alert("구간 설정 Err!");
	}
}

function resetSegment(){
	segEnd = 0;
	console.log("전체 Play"+segEnd);
}

function change(list){
	//console.log(list);
	//if($(list).is(':checked')){
	if($('#playlist input').is(':checked')){
		console.log("checked!");
	} else {
		$(list).addClass('active').siblings().removeClass('active');
        //var music = list.getAttribute('data-value');
        var music = $(list).attr('data-value');
		console.log(music);
		
        $('#myaudio source').attr('src', music);
        $("#myaudio")[0].load();
        // if not login setSegment(startTime, endTime);		// 구간재생 설정
        // else resetSegment();
		$("#myaudio")[0].play();
	}
}


function addList(){
	
	var music = $('#music_src').val().split('\\').pop().split('\\').pop().split('/').pop();
	console.log(music);
	
	$('#myaudio source').attr('src', "music/"+music);
    $("#myaudio")[0].load();
    // if not login setSegment(startTime, endTime);		// 구간재생 설정
    // else resetSegment();
	$("#myaudio")[0].play();
	
}

</script>

</head>
<body>

	<div>
	    <audio id="myaudio" preload="auto" controls autoplay>
    	    <source src="music/1_ABC.mp3">
    	</audio>
    </div>
	<p>
		<input type="file" id="music_src" accept="audio/*" >
		<input type="button" value="addlist" onclick="addList()">
	</p>
	<p>
		<button onclick="setSegment(10,15)">10초 ~ 15초 사이▶</button>
		<button onclick="resetSegment()">전체 ▶</button>
	</p>
    
</body>
</html>