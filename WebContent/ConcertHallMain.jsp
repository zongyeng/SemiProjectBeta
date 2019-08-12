<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".section2divdiv1").each(function(){
		$(this).css("height",function(){
			return $(this).width()*0.7+30px;
		});
	})
	$(".section2divdiv2").each(function(){
		$(this).css("height",function(){
			return $(this).width()*0.7+30px;
		});
	})
	$(".section2divdivdiv").each(function(){
		$(this).css("height",function(){
			return $(this).width()*0.7;
		});
	})
	$(".wholesection").eq(0).css("height",function(){
		return $(".section2").eq(0).height()+50px;
	})
	
	
	
})	
</script>
<style type="text/css">
	.wholesection{width : 100%; background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);
	background-attachment: fixed;
	background-repeat: no-repeat; }
	.section2 {width:100%;}
	.section2div {width : 70%; height : 100%; margin : 0 auto; 
					background-image:none; background-color: white;}
	.section2divdiv1 { width : 100%; margin: 0 auto; margin-top : 50px;}
	.section2divdiv2 { width : 100%; margin: 0 auto; margin-top : 50px; margin-bottom: 50px;}
	.section2divdivdiv { width : 100%; text-align: center; margin : 0 auto;}
	.section2divdivdiv img:hover {opacity: 0.5; cursor : pointer;}
	.section2divdivdiv p{ width : 80%; text-align: center; font-size: 30px;
							font-weight:bold; color : white; margin : 0 auto;
							margin-top : 20px; background-color: rgba(0,0,0,0.8);  }
	.section2divlabel {width : 100%; height : 90px; text-align: center;
						background-color: rgba(0,0,0,0.8);}
	.section2divlabel p{ text-align: center; font-size: 60px;
							font-weight:bold; color : white;
							 }
</style>
</head>
<body>
<%@ include file="./form/header.jsp"%>

<section class ="wholesection">

	<section class ="section2">
		<div class = "section2div">
			<div class = "section2divlabel">
				<p><span>CONCERT HALL</span></p>
			</div>
			<div class = "section2divdiv1" >
				<div class = "section2divdivdiv" onclick ="location.href('pagemoving.do?command=concerthalla')"> 
					<p><span>신도림 디큐브 아트센터</span></p>
					<div style="width:80%; margin:0 auto; margin-top : 20px;">
						<img src="images/ee.jpg" width="100%">
					</div>
				</div>
			</div>
			<div class = "section2divdiv2">
				<div class = "section2divdivdiv" onclick ="location.href('pagemoving.do?command=concerthallb')"> 
					<p><span>청담동 SAC 아트홀</span></p>
					<div style="width:80%; margin:0 auto; margin-top : 20px;">
						<img src="images/ff.jpg" width="100%">
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>