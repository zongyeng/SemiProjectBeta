<%@page import="semi.dto.loginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header design</title>
<script type="text/javascript" src="js/loginform.js"></script>
<script type="text/javascript">

<%
	loginDto userinfo = (loginDto)session.getAttribute("userdto");
%>

function logout(){
	 location.href="login.do?command=logout";
}

function search(){
	var searchcontent = document.getElementById("search").value;
	location.href="SearchEngine.do?command=search&searchcontent="+searchcontent;
}

</script>
<style type="text/css">
	*{ padding : 0px; margin : 0px;}
	.header{ width : 100%; height : 154px; 
	font-family: "Goyang"; }
	.headerdiv1{ width: 100%; height :100px;
				background-image: linear-gradient(-225deg, #E3FDF5 0%, #FFE6FA 100%);
				background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);	}
	.headerdiv2{ 	width: 100%; height :50px; 
					border-bottom : solid 2px;
					border-bottom-color: rgba(200,200,200,0.5); 
					border-top: solid 2px;
					border-top-color: rgba(200,200,200,0.5); 
					background: rgb(100,100,100);
				}
	.headerdivwrapa {float : left; width : 20%; height : 100px; text-align:center;}

	.headerdiv1div { width:70%; height:150px; margin : 0 auto; }
	.headerdiv1divdiv { width : 100%; height : 96px;}
	.headerdiv2div a{ padding :2px 20px; margin: 10px; font-size: 15px;
					vertical-align : middle; font-family: "Goyang";
					font-weight:bold;}
	.headerdiv2div { width : 70%; margin : 0 auto; height : 50px;
					 vertical-align : middle;
					 display : flex;}
	.headerdiv2divul{list-style: none;width : 100%;}	
	.headerdiv2divulli {float : left; width : calc(25% - 1.5px); height : 50px;text-align:center;
						border-left : 1px solid; border-left-color:rgba(200,200,200,0.5); 
						border-bottom : solid 2px;
						border-bottom-color: rgba(200,200,200,0.5);
						position : relative;  }
	.headerdiv2divullia {line-height:50px; text-decoration: none;
							font-weight:bold; color:#cccccc; } 
	.headerdiv2divulli:hover { background: rgb(80,80,80); transition : 0.5s;}						
	.headerdiv2divulli:hover .headerdiv2divullia{ color:#ffffff;}		
	.headerdiv2divulli:hover .headerdiv2divulliul{display : block; z-index:200;
													border-top : solid 2px;
													border-top-color: rgba(30,110,150,0.5); }			 
	.headerdiv2divulliul li{list-style: none;width : 100%;}				 
					 
	.headerunderdiv { width : 100%; height : 154px; margin : 0 auto;}
	.headerdiv2divulliul {display : none; background: rgb(100,100,100); width:100%; 
	 					  line-height:50px; position : absolute; z-index:200;}
	.headerdiv2divulliul li {border-bottom : solid 2px; 
							border-bottom-color: rgba(200,200,200,0.5);}
	.headerdiv2divulliul > li a { text-decoration: none;
							font-weight:bold; color:#cccccc;}
	.headerdiv2divulliul li:hover{background: rgb(80,80,80); transition : 0.5s;}
	.headerdiv2divulliul li:hover >a{color:#ffffff;}
	
						
	.hedaerdiv3 { display : none; width : 100%; height : 300px;}
	
	 #search { height: 30px; width: 95%; border: none;
 			 border-radius: 10px; padding: 5px;  }
	 #search:focus {outline : none;}
	.searchbar{ padding: 30px; width : 45%; }
 	.searchbardiv {display: flex; margin-left : 10px; width:80%; margin : 0 auto; text-align: center;}
    .searchbardivbtn { width : 40px; height: 40px; background-color: rgba(200,200,200,0.5);
  				  margin-left: 5px;border: none; border-radius: 10px;}
    .searchbardivbtn:hover {background-color: #B6B6B6; transition: .8s; cursor: pointer;}
    .searchbardivbtn:focus {outline : none;}
    
    .logindiv {padding-top:35px; padding-bottom: 35px; padding-right: 5px; width : 20%;}
    .logindivdiv {display : flex; width:80%; margin : 0 auto;}
    .logindivdivbtn { width : 100px; height: 30px; background-color: rgba(200,200,200,0.5);
  				  margin-left: 15px;border: none; border-radius: 10px; }
    .logindivdivbtn { width : 100px; height: 30px; background-color: rgba(200,200,200,0.5);
  				  margin-left: 15px;border: none; border-radius: 10px; }
  	.logindivdivbtn:hover {background-color: #B6B6B6; transition: .8s; cursor: pointer;}			  
	.logindivdivbtn:focus {outline : none;}
</style>
</head>
<body>


	<header class = "header">
		<div class = "headerunderdiv">
			<div class="headerdiv1">
				<div class="headerdiv1div">
					<div class = "headerdiv1divdiv">
						<div class = "headerdivwrapa">
						<a href = "pagemoving.do?command=musichome" class="headerdiv1a"><!-- 홈으로 링크 -->
							<img alt="Mutes logo" src="images/mutes2.png" width = "200px" height = "100px">
						</a>
						</div>
						
						<div class="logindiv" style="float : right;">
  							<div class="logindivdiv">   
  							
								<%
								if(userinfo == null) {
								%>
									<button onclick="location.href='UserLogin.jsp'" class="logindivdivbtn">
     								로그인   
   									</button>
   									<button onclick="location.href='UserSignUp.jsp'" class="logindivdivbtn">
     								회원가입
   									</button> 
   							    
						       <%}else{ %>
									<%=userinfo.getUserinfo_name()%>님 반갑습니다. 보유캐쉬 : <%=userinfo.getUserinfo_cash()%>원
									<button onclick="location.href='pagemoving.do?command=userinformation'" class="logindivdivbtn">
     								내정보보기  
   							  		</button>
   							    	<button onclick="logout()" class="logindivdivbtn">
     								로그아웃
   							    	</button>
   							   <% }%>
   							  

 							</div>
						</div>
						
						<div class="searchbar" style="float : right;">
  							<div class="searchbardiv">
   								<input type="text" id="search" type="text" placeholder="Search"/>
  								<button class="searchbardivbtn">
     								<img src="images/search.png" alt="대충 돋보기이미지" width="35px" height="35px" onclick="search()" />     
   							    </button>    
 							</div>
						</div>
						
						
					</div>
				</div>
			</div>
		
		
			<div class="headerdiv2">
				<div class="headerdiv2div">
					<ul class = "headerdiv2divul">
						<li class = "headerdiv2divulli" onclick = "location.href='pagemoving.do?command=musicgenre'">
							<a class = "headerdiv2divullia" href ="pagemoving.do?command=musicgenre"> 음악 </a>
							<ul class = "headerdiv2divulliul">
								<li><a href="pagemoving.do?command=musicgenre"> 장르별 음악 </a></li>
								<li><a href="pagemoving.do?command=musicalbumpopular"> 앨범 음악</a></li>
							</ul>
						</li>
						<li class = "headerdiv2divulli" onclick = "location.href='pagemoving.do?command=broadcstingtop'">
							<a class = "headerdiv2divullia" href ="pagemoving.do?command=broadcstingtop"> 방송 </a>
							<ul class = "headerdiv2divulliul">
								<li><a href="pagemoving.do?command=broadcstingtop"> 인기 방송 </a></li>
								<li><a href="pagemoving.do?command=broadcstingrecommand"> 추천 방송 </a></li>
								<li><a href="pagemoving.do?command=broadcstingnewest"> 신규 방송</a></li>
							</ul>
						</li>
						<li class = "headerdiv2divulli" onclick = "location.href='pagemoving.do?command=concerthallmain'">	
							<a class = "headerdiv2divullia" href ="pagemoving.do?command=concerthallmain"> 공연장 </a>
							<ul class = "headerdiv2divulliul">
								<li><a href="pagemoving.do?command=concerthallmain"> 소개 </a></li>
								<li><a href="pagemoving.do?command=concerthallreservation"> 예약하기 </a></li>
							</ul>
						</li>
						<li class = "headerdiv2divulli" 
						style = "border-right : 1px solid; border-right-color:rgba(200,200,200,0.5);"
						onclick = "location.href='pagemoving.do?command=servicecenter'">
							<a class = "headerdiv2divullia" href ="pagemoving.do?command=servicecenter">고객센터</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</header>
</body>
</html>