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

		var name = opener.document.getElementById("throwmusic").value;
		$('#myaudio source').attr('src', "music/"+name);
        $("#myaudio")[0].load();
		$("#myaudio")[0].play();
});

</script>

</head>
<body>
	
	<div>
	    <audio id="myaudio" preload="auto" controls autoplay>
    	    <source src="">
    	</audio>
    </div>
    
</body>
</html>