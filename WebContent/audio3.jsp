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

function delList(){
	if(!$('#playlist input').is(':checked')){
		alert("no checked list!");
	} else {
		var index = $('#playlist li').index($('#playlist li[class=active]'));
		console.log(index);
		
		$('#playlist input:checked').parent().remove();
		
		// if (!active) first = active; myaudio.src update; 
		var index1 = $('#playlist li').index($('#playlist li[class=active]'));
		console.log(index1);
		
		if(index1 == -1) { // don't have active
			var myaudio = document.getElementById("myaudio");
			$("#myaudio")[0].pause();				// current audio stop
			myaudio.currentTime = 0;	//stop
		}
		//$('#playlist li:first').addClass('active');
		$('#playlist li:eq('+index+')').addClass('active');
		var music = $('#playlist li[class=active]').attr('data-value');
		$('#myaudio source').attr('src', music);
		
	}
}

function addList(){
	
	var src = $('#music_src').val().split('\\').pop().split('\\').pop().split('/').pop();
	console.log(src);
	
	var li = document.createElement('li');
	li.setAttribute('data-value', "music/"+src);
	li.setAttribute('onclick', 'change(this)');
	li.innerHTML = src.split('.')[0].split('_').pop();
	//console.log(a);
	$('#playlist').append(li);
	$('#playlist li:last').prepend($("<input type='checkbox'/>"));
	
}

</script>

</head>
<body>

	<div>
	    <audio id="myaudio" preload="auto" controls autoplay>
    	    <source src="music/1_ABC.mp3">
    	</audio>
    </div>
    <ol id="playlist" >
    	<li class="active" data-value="music/1_ABC.mp3" onclick="change(this)"><input type="checkbox">ABC</li>
    	<li data-value="music/1_Stars.mp3" onclick="change(this)"><input type="checkbox">Stars</li>
        <li data-value="music/1_SuperSonny.mp3" onclick="change(this)"><input type="checkbox">SuperSonny</li>
        <li data-value="music/2_The Rose.mp3" onclick="change(this)"><input type="checkbox">The Rose</li>
        <li data-value="music/2_Sorry Seems To Be the Hardest Word.mp3" onclick="change(this)"><input type="checkbox" >Sorry Seems To Be the Hardest Word</li>
        <li data-value="music/2_Somewhere, Somebody.mp3" onclick="change(this)"><input type="checkbox">Somewhere, Somebody</li>
    </ol>
    	<p>
		 	<button onclick="delList()">delList</button>
		</p>
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