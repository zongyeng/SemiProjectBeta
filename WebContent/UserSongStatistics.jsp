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
			$(".informations ul").append("<li><a class='m' id='song<%=i%>' title=<%= list.get(i).getMusic_seq()%> href='#' ><%=list.get(i).getMusic_title().substring(list.get(i).getMusic_title().indexOf("_")+1)%></a></li>");
<%		
		}
%>
	});
	

	var person = JSON.stringify(<%=json%>);

    var oPerson = JSON.parse(person);
	
</script>

</head>
<body>
	
	<div>뮤지션 이름  : <input type="text" id="musician" readonly="readonly" /></div>

	<div>
		<div class="btn-group pull-right">
			<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">구분</button>
			<ul class="dropdown-menu" role="menu"  >
				<li><a class="n" title="donut" href="#">앨범(도넛차트)</a></li>
				<li><a class="n" title="multi_line" href="#">여러곡(라인차트)</a></li>
				<li><a class="n" title="stacked_bar" href="#">곡하나(막대차트)</a></li>
			</ul>
		</div>
		
		<div class="informations">
			<strong class="m"> 곡 제목</strong>
			<ul>
			
			</ul>
		</div>

		<div id="mbars"></div>
	</div>
	
	
<script type="text/javascript">
	var w = 600;                        //width
	var h = 500;                        //height
	var padding = {top: 40, right: 40, bottom: 40, left:40};
	var dataset;

	var stack = d3.layout.stack();
	
	dataset = oPerson;

	stack(dataset);

	var color_hash = {
		0 : ["추천수","#1f77b4"],
		1 : ["조회수","#2ca02c"]
	};
			
			
	var xScale = d3.time.scale()
		.domain([new Date("2019", dataset[0][dataset[0].length-8].month, dataset[0][dataset[0].length-8].day, 0, 0, 0, 0),d3.time.day.offset(new Date("2019", dataset[0][dataset[0].length-1].month, dataset[0][dataset[0].length-1].day, 0, 0, 0, 0),1)])
		.rangeRound([10, w-padding.left-padding.right]);

	var yScale = d3.scale.linear()
		.domain([0,d3.max(dataset, function(d) {return d3.max(d, function(d) {return d.y0 + d.y;});})])
		.range([h-padding.bottom-padding.top,0]);

	var xAxis = d3.svg.axis()
				.scale(xScale)
				.orient("bottom")
				.ticks(d3.timeDay,1);

	var yAxis = d3.svg.axis()
				.scale(yScale)
				.orient("left")
				.ticks(10);

	//Easy colors accessible via a 10-step ordinal scale
	var colors = d3.scale.category10();

	//Create SVG element
	var svg = d3.select("#mbars")
				.append("svg")
				.attr("width", w)
				.attr("height", h);

	// Add a group for each row of data
	var groups = svg.selectAll("g")
				.data(dataset)
				.enter()
				.append("g")
				.attr("class","rgroups")
				.attr("transform","translate("+ padding.left + "," + (h - padding.bottom) +")")
				.style("fill", function(d, i) { return color_hash[dataset.indexOf(d)][1]; });

	// Add a rect for each data value
	var rects = groups.selectAll("rect")
				.data(function(d) { return d; })
				.enter()
				.append("rect")
				.attr("width", 2)					
				.style("fill-opacity",1e-6);


	rects.transition()
				.duration(function(d,i){ return 500 * i; })
				.ease("linear")
				.attr("x", function(d) { return xScale(new Date("2019",d.month,d.day, 0, 0, 0, 0)); })
				.attr("y", function(d) {
					return -(- yScale(d.y0) - yScale(d.y) + (h - padding.top - padding.bottom)*2);
				})
				.attr("height", function(d) {
					return -yScale(d.y) + (h - padding.top - padding.bottom);
				})
				.attr("width", 15)
				.style("fill-opacity",1);

	svg.append("g")
		.attr("class","x axis")
		.attr("transform","translate(40," + (h - padding.bottom) + ")")
		.call(xAxis);


	svg.append("g")
		.attr("class","y axis")
		.attr("transform","translate(" + padding.left + "," + padding.top + ")")
		.call(yAxis);

		
	// adding legend
	var legend = svg.append("g")
							.attr("class","legend")
							.attr("x", w - padding.right - 65)
							.attr("y", 25)
							.attr("height", 100)
							.attr("width", 100);

	legend.selectAll("g").data(dataset)
				.enter()
				.append('g')
				.each(function(d,i){
					var g = d3.select(this);
					g.append("rect")
						.attr("x", w - padding.right - 65)
				  		.attr("y", i*25 + 10)
				  		.attr("width", 10)
				  		.attr("height",10)
				  		.style("fill",color_hash[String(i)][1]);

				  	g.append("text")
				  	 .attr("x", w - padding.right - 50)
				  	 .attr("y", i*25 + 20)
				  	 .attr("height",30)
				  	 .attr("width",100)
				  	 .style("fill",color_hash[String(i)][1])
				  	 .text(color_hash[String(i)][0]);
				  });

	svg.append("text")
				.attr("transform","rotate(-90)")
				.attr("y", 0 - 5)
				.attr("x", 0-(h/2))
				.attr("dy","1em")
				.text("Number");

	svg.append("text")
			   .attr("class","xtext")
			   .attr("x",w/2 - padding.left)
			   .attr("y",h - 5)
			   .attr("text-anchor","middle")
			   .text("Days");

	svg.append("text")
	        .attr("class","title")
	        .attr("x", (w / 2))             
	        .attr("y", 20)
	        .attr("text-anchor", "middle")  
	        .style("font-size", "16px") 
	        .text("<%=list.get(0).getMusic_title().substring(list.get(0).getMusic_title().indexOf("_")+1)%>");

	function after(){			
	d3.selectAll(".m")
				.on("click", function() {
					alert("1");
					var songseq = id.getAttribute('title');
					$(function(){ 
						$.ajax({
							type: 'post',
							url: 'search.do?command=song&songseq='+songseq,
							dataType : 'html',
							success: function(data) {
								eval("var person = " + data + ";");
							}
						});
					});
					
				    var str = JSON.parse(person);
					
					dataset = str;
					stack(dataset);

					xScale.domain([new Date("2019", dataset[0][dataset[0].length-8].month, dataset[0][dataset[0].length-8].day, 0, 0, 0, 0),new Date("2019", dataset[0][dataset[0].length-1].month, dataset[0][dataset[0].length-1].day, 0, 0, 0, 0)])
					.rangeRound([0, w-padding.left-padding.right]);

					yScale.domain([0,d3.max(dataset, function(d) {
						return d3.max(d, function(d) {
							return d.y0 + d.y;
							});
						})]
					)
					.range([h-padding.bottom-padding.top,0]);

					xAxis.scale(xScale)
						.ticks(d3.time.hour,2)
						.tickFormat(d3.time.format("%H"));

					yAxis.scale(yScale)
						.orient("left")
						.ticks(10);

					groups = svg.selectAll(".rgroups")
						.data(dataset);

					groups.enter().append("g")
						.attr("class","rgroups")
						.attr("transform","translate("+ padding.left + "," + (h - padding.bottom) +")")
						.style("fill",function(d,i){
								return color(i);
							}
						);


					rect = groups.selectAll("rect")
					.data(function(d){return d;});

					rect.enter()
						.append("rect")
						.attr("x",w)
						.attr("width",1)
						.style("fill-opacity",1e-6);

					rect.transition()
						.duration(1000)
						.ease("linear")
						.attr("x",function(d){
							return xScale(new Date("2019",d.month,d.day, 0, 0, 0, 0));
						})
						.attr("y",function(d){
							return -(- yScale(d.y0) - yScale(d.y) + (h - padding.top - padding.bottom)*2);
						})
						.attr("height",function(d){
							return -yScale(d.y) + (h - padding.top - padding.bottom);
						})
						.attr("width",15)
						.style("fill-opacity",1);

					rect.exit()
						.transition()
						.duration(1000)
						.ease("circle")
						.attr("x",w)
						.remove();

					groups.exit()
						.transition()
						.duration(1000)
						.ease("circle")
						.attr("x",w)
						.remove();


					svg.select(".x.axis")
						.transition()
						.duration(1000)
						.ease("circle")
						.call(xAxis);

					svg.select(".y.axis")
						.transition()
						.duration(1000)
						.ease("circle")
						.call(yAxis);

					svg.select(".xtext")
						.text("Hours");

					svg.select(".title")
						.text("Number of messages per hour on " + date + ".");
				});
	}
	
	window.onload = function(){
		after();
	}

</script>

</body>
</html>