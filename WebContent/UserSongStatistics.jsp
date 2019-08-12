<%@page import="org.json.simple.JSONArray"%>
<%@page import="semi.dto.stacked_barDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/d3.v3.js"></script>

<script type="text/javascript" src="js/bootstrap.js"></script>
<link rel="stylesheet" href="resources/bootstrap.css">

<link rel="stylesheet" href="resources/Stacked_bar-charts.css">

<script type="text/javascript">

<%
	List<stacked_barDto> list = (List<stacked_barDto>)request.getAttribute("list");
	JSONArray json = (JSONArray)request.getAttribute("json");
	String musicianname = (String)request.getAttribute("musicianname");
%>
	$(function(){
		$(".informations").css({position : "absolute", left:"610px", top:"150px"});
		$("#musician").prop("value","<%=musicianname%>");
		
<%
		for(int i =0; i<list.size(); i++){
%>
			$(".informations ul").append("<li><a class='m' id='song<%=i%>' title=<%= list.get(i).getMusic_seq()%> href='#' onclick='loadmusicchart(this)' ><%=list.get(i).getMusic_title().substring(list.get(i).getMusic_title().indexOf("_") + 1)%></a></li>");
<%}%>
	});
	

	var person = JSON.stringify(<%=json%>);
    var oPerson = JSON.parse(person);
	
</script>

</head>
<body>

	<div>
		뮤지션 이름 : <input type="text" id="musician" readonly="readonly" />
	</div>

	<div>
		<div class="btn-group pull-right">
			<button type="button" class="btn btn-primary dropdown-toggle"
				data-toggle="dropdown">구분</button>
			<ul class="dropdown-menu" role="menu">
				<li><a class="n" title="donut" href="#">앨범(도넛차트)</a></li>
				<li><a class="n" title="multi_line" href="#"
					onclick="multi_line()">여러곡(라인차트)</a></li>
				<li><a class="n" title="stacked_bar" href="#"
					onclick="stacked_bar()">곡하나(막대차트)</a></li>
			</ul>
		</div>

		<div class="informations">
			<strong class="m"> 곡 제목</strong></br>
			<ul>

			</ul>
		</div>

		<div id="mbars"></div>
	</div>


	<script type="text/javascript" src="js/stacked_bar.js"></script>

<script>
	
	var selectsongs = new Array();
	function multi_line(){
		var music = $(".m");
		$(".informations>div").remove();
		$(".informations").append("<div id='multi_linemenu'></div>");
		for(var i = 1; i<music.length; i++)	{
			var id = music.eq(i).prop('id');
			var title = music.eq(i).prop('title');
			var value = music.eq(i).text();
			if(i==1){
				$(".informations>div").append("<input type='checkbox' id='"+id+"' title='"+title+"' checked='checked' value='"+value+"' />"+value+"</br>");	
			} else {
				$(".informations>div").append("<input type='checkbox' id='"+id+"' title='"+title+"' value='"+value+"' />"+value+"</br>");
			}
		}
		$(".informations>ul").hide();
		$("#mbars").children().remove();
		
		selectsongs[0] = $(".informations>div input").eq(0).prop("title");
		
		$(".informations>div input").change(function(){
			if($(this).prop("checked")){
	            selectsongs.push($(this).prop("title"));
	        }else{
	        	selectsongs.splice(selectsongs.indexOf($(this).prop("title")),1);
	        }
			
			multi_lineshow();
			
	    });
	}
	
	function multi_lineshow(){
		
		var form = document.createElement("form");
		
		var input = document.createElement('input');
		input.type = 'hidden';
		input.name = "selectsongs";
		input.value = selectsongs.length;
	
		form.appendChild(input);
		
		for(var i =0; i<selectsongs.length;i++){
			var input = document.createElement('input');
			input.type = 'hidden';
			input.name = "selectsong"+i;
			input.value = selectsongs[i];
		
			form.appendChild(input);
		}
		 
		document.body.appendChild(form);

		var str = $("form").serialize();
	      
		$.ajax({
			type : 'post',
			url : 'search.do?command=multi_linesong',
			data : str,
			dataType : 'html',
			success : function(data) {
				
			}
		});
		
		document.body.removeChild(form);
		
		var series = ["2016", "2017"];
		var dataset = [ {'A': 9, 'B':19, 'C':29, 'D':39, 'E':29, 'F':19, 'G':9}, 
							{'A':17, 'B':27, 'C':37, 'D':27, 'E':17, 'F':7, 'G':0} ]; 
		var keys = d3.keys(dataset[0]); 
		var data = []; 
		
	}
</script>

	<script type="text/javascript">
		$(function(){
			stacked_bar();
			$(".title").text("<%=list.get(0).getMusic_title().substring(list.get(0).getMusic_title().indexOf("_") + 1)%>");
		});
	</script>

</body>
</html>