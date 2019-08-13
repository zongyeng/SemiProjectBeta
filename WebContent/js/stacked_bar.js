function stacked_bar() {
	$("#mbars").children().remove();
	$(".informations>div").hide();
	$(".informations>ul").show();
	
	w = 600; // width
	h = 500; // height
	padding = {
		top : 40,
		right : 40,
		bottom : 40,
		left : 40
	};
	

	stack = d3.layout.stack();

	dataset = oPerson;

	stack(dataset);

	color_hash = {
		0 : [ "추천수", "#1f77b4" ],
		1 : [ "조회수", "#2ca02c" ]
	};

	xScale = d3.time.scale().domain(
			[
					new Date("2019", dataset[0][dataset[0].length - 8].month,
							dataset[0][dataset[0].length - 8].day, 0, 0, 0, 0),
					d3.time.day.offset(new Date("2019",
							dataset[0][dataset[0].length - 1].month,
							dataset[0][dataset[0].length - 1].day, 0, 0, 0, 0),
							1) ]).rangeRound(
			[ 10, w - padding.left - padding.right ]);

	yScale = d3.scale.linear().domain([ 0, d3.max(dataset, function(d) {
		return d3.max(d, function(d) {
			return d.y0 + d.y;
		});
	}) ]).range([ h - padding.bottom - padding.top, 0 ]);

	xAxis = d3.svg.axis().scale(xScale).orient("bottom").ticks(d3.timeDay,
			1);

	yAxis = d3.svg.axis().scale(yScale).orient("left").ticks(10);

	// Easy colors accessible via a 10-step ordinal scale
	colors = d3.scale.category10();

	// Create SVG element
	svg = d3.select("#mbars").append("svg").attr("width", w).attr("height",
			h);

	// Add a group for each row of data
	groups = svg.selectAll("g").data(dataset).enter().append("g").attr(
			"class", "rgroups").attr("transform",
			"translate(" + padding.left + "," + (h - padding.bottom) + ")")
			.style("fill", function(d, i) {
				return color_hash[dataset.indexOf(d)][1];
			});

	// Add a rect for each data value
	rects = groups.selectAll("rect").data(function(d) {
		return d;
	}).enter().append("rect").attr("width", 2).style("fill-opacity", 1e-6);

	rects.transition()
			.duration(function(d, i) {
				return 500 * i;
			})
			.ease("linear")
			.attr("x", function(d) {
				return xScale(new Date("2019", d.month, d.day, 0, 0, 0, 0));
			})
			.attr(
					"y",
					function(d) {
						return -(-yScale(d.y0) - yScale(d.y) + (h - padding.top - padding.bottom) * 2);
					}).attr("height", function(d) {
				return -yScale(d.y) + (h - padding.top - padding.bottom);
			}).attr("width", 15).style("fill-opacity", 1);

	svg.append("g").attr("class", "x axis").attr("transform",
			"translate(40," + (h - padding.bottom) + ")").call(xAxis);

	svg.append("g").attr("class", "y axis").attr("transform",
			"translate(" + padding.left + "," + padding.top + ")").call(yAxis);

	// adding legend
	legend = svg.append("g").attr("class", "legend").attr("x",
			w - padding.right - 65).attr("y", 25).attr("height", 100).attr(
			"width", 100);

	legend.selectAll("g").data(dataset).enter().append('g').each(
			function(d, i) {
				var g = d3.select(this);
				g.append("rect").attr("x", w - padding.right - 65).attr("y",
						i * 25 + 10).attr("width", 10).attr("height", 10)
						.style("fill", color_hash[String(i)][1]);

				g.append("text").attr("x", w - padding.right - 50).attr("y",
						i * 25 + 20).attr("height", 30).attr("width", 100)
						.style("fill", color_hash[String(i)][1]).text(
								color_hash[String(i)][0]);
			});

	svg.append("text").attr("transform", "rotate(-90)").attr("y", 0 - 5).attr(
			"x", 0 - (h / 2)).attr("dy", "1em").text("Number");

	svg.append("text").attr("class", "xtext").attr("x", w / 2 - padding.left)
			.attr("y", h - 5).attr("text-anchor", "middle").text("Days");

	svg.append("text").attr("class", "title").attr("x", (w / 2)).attr("y", 20)
			.attr("text-anchor", "middle").style("font-size", "16px");
}
function loadmusicchart(id) {
	var songseq = id.getAttribute('title');
	$(function() {
			$.ajax({
					type : 'post',
					url : 'search.do?command=song&songseq=' + songseq,
					dataType : 'html',
					success : function(data) {
						eval("var change = " + data + ";");

						if (change < 10) {
							$(".rgroups").children().remove();
							$("#errorMassege").remove();
							$("#mbars")
									.append(
											"<div id='errorMassege'><strong>자료가 부족합니다.(10이상의 조회수가 필요합니다.)</strong>현재 조회수 : "
													+ data + "</div>");
							return;
						}
						change = JSON.stringify(change);
						var str = JSON.parse(change);
						
						dataset = str;
						stack(dataset);

						if (dataset[0].length < 7) {
							$(".rgroups").children().remove();
							$("#errorMassege").remove();
							$("#mbars")
									.append(
											"<div id='errorMassege'><strong>자료가 부족합니다.(10이상의 조회수가 필요합니다.)</strong>현재 조회수 : "
													+ data + "</div>");
							return;
						}

						xScale
								.domain(
										[
												new Date(
														"2019",
														dataset[0][dataset[0].length - 8].month,
														dataset[0][dataset[0].length - 8].day,
														0, 0, 0, 0),
												d3.time.day
														.offset(
																new Date(
																		"2019",
																		dataset[0][dataset[0].length - 1].month,
																		dataset[0][dataset[0].length - 1].day,
																		0, 0,
																		0, 0),
																1) ])
								.rangeRound(
										[ 10, w - padding.left - padding.right ]);

						yScale.domain([ 0, d3.max(dataset, function(d) {
							return d3.max(d, function(d) {
								return d.y0 + d.y;
							});
						}) ]).range([ h - padding.bottom - padding.top, 0 ]);

						xAxis.scale(xScale);

						yAxis.scale(yScale);

						groups = svg.selectAll(".rgroups").data(dataset);

						groups.enter().append("g").attr("class", "rgroups")
								.attr(
										"transform",
										"translate(" + padding.left + ","
												+ (h - padding.bottom) + ")")
								.style("fill", function(d, i) {
									return color(i);
								});

						rect = groups.selectAll("rect").data(function(d) {
							return d;
						});

						rect.enter().append("rect").attr("x", w).attr("width",
								1).style("fill-opacity", 1e-6);

						rect
								.transition()
								.duration(1000)
								.ease("linear")
								.attr(
										"x",
										function(d) {
											return xScale(new Date("2019",
													d.month, d.day, 0, 0, 0, 0));
										})
								.attr(
										"y",
										function(d) {
											return -(-yScale(d.y0)
													- yScale(d.y) + (h
													- padding.top - padding.bottom) * 2);
										})
								.attr(
										"height",
										function(d) {
											return -yScale(d.y)
													+ (h - padding.top - padding.bottom);
										}).attr("width", 15).style(
										"fill-opacity", 1);

						rect.exit().transition().duration(1000).ease("circle")
								.attr("x", w).remove();

						groups.exit().transition().duration(1000)
								.ease("circle").attr("x", w).remove();

						svg.select(".x.axis").transition().duration(1000).ease(
								"circle").call(xAxis);

						svg.select(".y.axis").transition().duration(1000).ease(
								"circle").call(yAxis);

						var songname = id.text;
						svg.select(".title").text(songname);
						$("#errorMassege").remove();
					}
				});
	});
}