var margin = {top: 20, right: 15, bottom: 60, left: 60}
  , width = 960 - margin.left - margin.right
  , height = 500 - margin.top - margin.bottom;

	var svg = d3.select("#chart").append('svg')
							.attr('width',  width + margin.left + margin.right)
							.attr('height', height + margin.top + margin.bottom)
							.style('background', '#C9D7D6')
							.append('g')
							.attr("transform", "translate(" + margin.left + "," + margin.top + ")");

		//setup x
		var xValue = function(d){return d[0];},
				xScale = d3.scale.linear().range([0, width]),
				xMap   = function(d) { return xScale(xValue(d));},
    		xAxis  = d3.svg.axis().scale(xScale).orient("bottom");		
		// setup y
		var yValue = function(d) { return d[1];},
				yScale = d3.scale.linear().range([height, 0]),
				yMap   = function(d) { return yScale(yValue(d));},
		    yAxis  = d3.svg.axis().scale(yScale).orient("left");

d3.json("http://localhost:4567/readings", function(error, data){
	dataset = data['dataset'];	 
	data_means = data['means'];
	// setup scales
	xScale.domain([d3.min(dataset, xValue)-1, d3.max(dataset, xValue)+1]);
	yScale.domain([d3.min(dataset, yValue)-1, d3.max(dataset, yValue)+1]);

 // update x-axis
 svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis)
 		.append("text")
    .attr("class", "label")
    .attr("x", width)
    .attr("y", -6)
    .style("text-anchor", "end");

 // update y-axis
 svg.append("g")
    .attr("class", "y axis")
    .call(yAxis)
 		.append("text")
    .attr("class", "label")
    .attr("transform", "rotate(-90)")
    .attr("y", 6)
    .attr("dy", ".71em")
    .style("text-anchor", "end"); 

	// draw your data
	
	svg.selectAll("#chart")
	   .data(dataset)
	   .enter().append("circle")
	   .attr("id", "chart")
	   .attr("r",0)
  	 .transition()
  	 .attr("r",4)
  	 .duration(1500)
  	 .delay(500)	   
 	   .attr("cx", xMap)
     .attr("cy", yMap);
	

	svg.selectAll(".means")
	   .data(data_means.pop())
	   .enter().append("circle")
	   .attr("class", "means")
	   .attr("r",0)
	   .transition()
	   .attr("r",10)
  	 .duration(1500)
  	 .delay(1500)	   
	   .attr('cx', xMap)
	   .attr('cy', yMap);

});
