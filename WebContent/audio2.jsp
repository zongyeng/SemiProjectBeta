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

$(function(){
	//var index = 1;
	$('#next').click(function() {
		
/*		//var index = document.getElementById("playlist").selectedIndex;
		var index = $('#playlist option').index($('#playlist option:selected'));
		//console.log(index, index1);
		index++;
		if(index > $('#playlist option').length-1) index=0;
		console.log( index + '번째 소스 재생' );


		//var tmp = index-1;
		$('#playlist option:eq('+index+')').prop('selected',true).siblings().prop('selected',false);
*/		
		if($('#playlist option:selected').is(':last-child')){
			console.log("option:last");
			$('#playlist option:first').prop('selected',true).siblings().prop('selected',false);
		} else {
			$('#playlist option:selected').next().prop('selected',true).siblings().prop('selected',false);
		}
		
		
		$('#myaudio source').attr('src',
				$('#playlist option:selected').attr('value'));
		$("#myaudio")[0].load();
		$("#myaudio")[0].play();
	});

	$('#prev').click(function() {

/*		var index = $('#playlist option').index($('#playlist option:selected'));
		index--;
		if(index <= 0 ) index=$('#playlist option').length-1;
		console.log( index + '번째 소스 재생' );
		
		
		$('#playlist option:eq('+index+')').prop('selected',true).siblings().prop('selected',false);
*/		
		if($('#playlist option:selected').is(':first-child')){
			console.log("option:first");
			$('#playlist option:last').prop('selected',true).siblings().prop('selected',false);
		} else {
			$('#playlist option:selected').prev().prop('selected',true).siblings().prop('selected',false);
		}
/*		for(var i=0; i<$('#playlist option').size(); i++){
			if(i == index-1){
				$('#playlist option:eq('+i+')').prop('selected',true);
			}else{
				$('#playlist option:eq('+i+')').prop('selected',false);
			}
		}
*/
		$('#myaudio source').attr('src',
				$('#playlist option:selected').attr('value'));
			
		$("#myaudio")[0].load();
		$("#myaudio")[0].play();
	});

	$('#playlist').change(function(){
		$('#myaudio source').attr('src', this.value);
		$("#myaudio")[0].load();
		// if not login setSegment(startTime, endTime);		// 구간재생 설정
        // else resetSegment();
		$("#myaudio")[0].play();
	});

	var myAudio=document.getElementById('myaudio');
	myAudio.addEventListener("ended", function() {

/*		index = $('#playlist option').index($('#playlist option:selected'));
		//console.log( index + '지금 재생' );
		index++;
		if(index > $('#playlist option').length-1) index=0;
		console.log( index + '번째 소스 재생' );
		
		$('#playlist option:eq('+index+')').prop('selected',true).siblings().prop('selected',false);
*/		
		//console.log($('#playlist option:selected').is(':last-child'));
		if($('#playlist option:selected').is(':last-child')){
			console.log("option:last");
			$('#playlist option:first').prop('selected',true).siblings().prop('selected',false);
		} else {
			$('#playlist option:selected').next().prop('selected',true).siblings().prop('selected',false);
		}
		//var tmp = $('#playlist option:selected').val();
		//var tmp1 = $('#playlist option:eq('+index+')').val();
		//console.log(tmp, tmp1);
		$('#myaudio source').attr('src', $('#playlist option:selected').val());
		$("#myaudio")[0].load();
		// if not login setSegment(startTime, endTime);		// 구간재생 설정
        // else resetSegment();
		$("#myaudio")[0].play();
	});
});

function addList(){
	
	var src = $('#music_src').val().split('/').pop().split('\\').pop();
	console.log(src);
	
	var opt = document.createElement('option');
	//var opt = new Option(text, value);

	opt.value = "music/"+src;
	opt.text = src.split('.')[0].split('_').pop();
	$('#playlist').append(opt);
	//$("#playlist").append($('<option>', { value: opt.value, text: opt.text });
	//$('#playlist').append('<option value='+opt.value+'>'+opt.text+'</option>');
}

function delList(){
	
	var index = $('#playlist option').index($('#playlist option:selected'));
	console.log(index);
	//index++;
	$('#playlist option:selected').remove();
	
	// if (!selected) next:selected; myaudio.src update; 
	//if(index == -1) { // not active
		//var myaudio = document.getElementById("myaudio");
		$("#myaudio")[0].pause();				// current audio stop 
		//if($('#playlist option').is(':selected')){
		//	console.log("true:selected");
		//} else{
			$('#playlist option:eq('+index+')').prop('selected',true).siblings().prop('selected',false);
		//}
		
		var music = $('#playlist option:selected').val();
		console.log(music);
		$('#myaudio source').attr('src', music);
	//}
}

</script>

</head>
<body>

	<div>
		<audio id="myaudio" controls preload="auto" autoplay>
			<source src="music/1_ABC.mp3">
		</audio>
	</div>
		<select id="playlist">
			<option value="music/1_ABC.mp3">ABC</option>
			<option value="music/1_Stars.mp3">Stars</option>
			<option value="music/1_SuperSonny.mp3">SuperSonny</option>
			<option value="music/2_The Rose.mp3">The Rose</option>
			<option value="music/2_Sorry Seems To Be the Hardest Word.mp3">Sorry Seems To Be the Hardest Word</option>
			<option value="music/2_Somewhere, Somebody.mp3">Somewhere, Somebody</option>
		</select>

		<p>
		 	<button id="next">다음곡</button>
		 	<button id="prev">이전곡</button>
		 	<button onclick="delList()">delList</button>
		</p>
		<p>
 			<input type="file" id="music_src" accept="audio/*" >
			<input type="button" value="addlist" onclick="addList()">
		</p>
	

</body>
</html>