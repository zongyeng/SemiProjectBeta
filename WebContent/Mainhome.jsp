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
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지1"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목1</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지2"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목2</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지3"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목3</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지4"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목4</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지5"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목5</span>
					</div>
				</div>
			</div>
			<div class = "section1div2div2div1">
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지6"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목6</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지7"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목7</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지8"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목8</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지9"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목9</span>
					</div>
				</div>
				<div class = "section1div2div2div1div">
					<div class = "section1div2div2div1divdiv1">
						<img src="" alt ="앨범이미지10"/>
					</div>
					<div class = "section1div2div2div1divdiv2">
						<span>곡 제목10</span>
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
	</div>.
</section>
<%@ include file="./form/footer.jsp"%>
</body>
</html>