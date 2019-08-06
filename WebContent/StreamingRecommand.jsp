<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".section1div2div2div1divdiv1").each(function(){
		$(this).css("height",function(){
			return $(this).width();
		});
	})
	
	$(".section2div2div2div1divdiv1").each(function(){
		$(this).css("height",function(){
			return $(this).width();
		});
	})
})	
</script>
<style type="text/css">
	.section1 { width : 100%; height : 1500px;}
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
								
</style>
</head>
<body>
<%@ include file="./form/header.jsp"%>
<section class = "section1">
	<div class = "section1div2">
		<div class = "section1div2div1">
			<div class = "section1div2div1div">
			<span> 추천 스트리밍 </span>
			</div>
		</div>
		<div class = "section1div2div2">
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지1"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목1</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지2"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목2</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지3"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡스트리밍 제목3</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지4"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목4</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지5"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목5</span>
					</div>
				</div>
			</div>
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지6"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목6</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지7"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목7</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지8"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목8</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지9"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목9</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지10"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡스트리밍 제목10</span>
					</div>
				</div>
			</div>
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지11"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목11</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지12"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목12</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지13"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목13</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지14"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목14</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지15"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡스트리밍 제목15</span>
					</div>
				</div>
			</div>
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지16"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목16</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지17"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목17</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지18"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목18</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지19"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>스트리밍 제목19</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="스트리밍이미지20"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡스트리밍 제목20</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<%@ include file="./form/footer.jsp"%>
</body>
</html>