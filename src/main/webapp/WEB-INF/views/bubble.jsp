<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src = "https://d3js.org/d3-color.v1.min.js"></script>
	<script src = "https://d3js.org/d3-dispatch.v1.min.js"></script>
	<script src = "https://d3js.org/d3-ease.v1.min.js"></script>
	<script src = "https://d3js.org/d3-interpolate.v1.min.js"></script>
	<script src = "https://d3js.org/d3-selection.v1.min.js"></script>
	<script src = "https://d3js.org/d3-timer.v1.min.js"></script>
	<script src = "https://d3js.org/d3-transition.v1.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
<style>

</style>
<title>바글바글</title>
<body>
	<div class=" w3-display-topmiddle">
  	<h1 class="w3-xxlarge w3-animate-top">어떤 직종을 계획하고 계세요?</h1>
	 <script>
	 	dataset = {
             "children": [
            	 {"Name":"한식","Count":26013},
                 {"Name":"중식","Count":2354},
                 {"Name":"양식","Count":253},
                 {"Name":"일식/수산물","Count":7942},
                 {"Name":"분식","Count":6469},
                 {"Name":"유흥주점","Count":5462},
                 {"Name":"닭/오리요리","Count":4928},
                 {"Name":"기타","Count":3297}]
          };
	 	  var width = 1000;
          var height = 900;
          var color = ['#cf0000', '#de6a6c', '#ed8b70', "#ffdcb4", "ffc37d", "e84a5f", "fc913a", "ff4e50"];

          var bubble = d3.pack(dataset)
		              .size([(width*0.8), (height*0.7)])
		              .padding(10);

          var svg = d3.select("body")
              .append("center")
              .append("svg")
              .attr("width", width)
              .attr("height", height)
              .attr("class", "bubble")
              .append("a")
              .attr("xlink:href","/bbs/template.bbs"); //I have to create ass servlet for the elements
              // .margin(20

          var nodes = d3.hierarchy(dataset)
              			.sum(function(d) {
                				return d.Count;
             		 });

          var node = svg.selectAll(".node")
			              .data(bubble(nodes).descendants())
			              .enter()
			              .filter(function(d){
			                  return !d.children
			              })
			              .append("g")
			              .attr("class", "node")
			              .attr("transform", function(d) {
			                  return "translate(" + d.x + "," + d.y + ")";
			              });
		  //display the data
          node.append("title")
              .text(function(d) {
                  return d.Name + ": " + d.Count;
              });

          node.append("circle")
              .attr("r", function(d) {
                  return d.r;
              })
              .style("fill", function(d,i) {
                  return color[i];
              });


          node.append("text")
              .attr("dy", ".2em")
              .style("text-anchor", "middle")
              .text(function(d) {
                  return d.data.Name.substring(0, d.r / 3);
              })
              .attr("font-family", "sans-serif")
              .attr("font-size", function(d){
                  return d.r/3;
              })
              .attr("fill", "white");

          node.append("text")
              .attr("dy", "1.3em")
              .style("text-anchor", "middle")
              .text(function(d) {
                  return d.data.Count;
              })
              .attr("font-family",  "Gill Sans", "Gill Sans MT")
              .attr("font-size", function(d){
                  return d.r/5;
              })
              .attr("fill", "white");

          d3.select(self.frameElement)
              .style("height", height + "px");

      </script>
      </div>
</body>
</html>
