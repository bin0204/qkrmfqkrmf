
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결과 페이지</title>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.9.7/d3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.3/c3.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>

<p><b>그래프</b></p>
<hr>
</head>
<body>
	<div id="combo"> 
		<select id="gu" name="gu"> 
			<option>구·군</option>	
		</select>
		<select id="dong" name="dong">
			<option>동·읍·면</option>
		</select>
		<input id = search type="button" value="확인" />
	</div>
 
	<div style="width: 500px">
		<div id="chart"></div>
	</div>
</body>

<script>
	// 조회 버튼 누르면 그래프 그리기
	$(document).ready(function() {
		$("#search").click(function() {
			$.ajax({
				url : "http://127.0.0.1:8090/bbs/json/result.bbs",
				type : "get", //get post둘중하나
				data : {},
				success : function(data) {
					var obj = data;
					var analysis_result = obj.analysis_result;
					var comboGu = document.getElementById("gu");
					var comboDong = document.getElementById("dong");
					var col = "["; 
					
					for (var i = 0; i < analysis_result.length; i++) {
						if (comboGu.value==analysis_result[i].GU ) {
							if ( comboDong.value == analysis_result[i].DONG) {
								var gu = analysis_result[i].GU;
								var dong = analysis_result[i].DONG;
								var result1 = analysis_result[i].RESULT1;
								
								col += "['" + dong + "'," + result1 + "]";
							}
							else if (comboDong.value == "전체") { 
								var gu = analysis_result[i].GU;
								var dong = analysis_result[i].DONG;
								var result1 = analysis_result[i].RESULT1;
								
								if(col=="["){
									col = col + "['" + dong + "'," + result1 + "]";
								}
								else
									col = col + ",['" + dong + "'," + result1 + "]"; 
							} 
						}
					}
					col += "]";
					//----------------------------------------
					var html = "";
					html += "<table border=1>"
					html += "<tr>";
					html += "<td>" + col + "</td>";
					html += "</tr>";
					html += "</table>";
					$("#combo").append(html);
					//-----------------------------------------
					var chart = c3.generate({
						bindto : '#chart',
						data : {
							columns :
									eval(col) 
							 	, 
							type : 'pie'
						},
					});
				}
			});
			return false; //자기자신이 submit이나 뭔가 실행하는기능이 있다면 그것을 막고 위에 내용만 실행
		});
	});

	//-----------------------------------------------------------------------------------------------------------------------------
	// <구·군> 콤보박스 띄우기
	$(document).ready(
			function() {
				$.getJSON("http://127.0.0.1:8090/bbs/json/result.bbs", function(data) {
					var obj = data;
					var analysis_result = obj.analysis_result;
					var gu;
					
					for (var i = 0; i < analysis_result.length; i++) {
								if(gu ==  analysis_result[i].GU){}
								else{	
									var option = "<option value='" + analysis_result[i].GU + "'>"+ analysis_result[i].GU + "</option>";
									$('#gu').append(option);
									gu =  analysis_result[i].GU;
									
								}
						}
				});
			});

	//-----------------------------------------------------------------------------------------------------------------------------
				
	// <동·읍·면> 동적콤보박스 띄우기
	$(document).ready(function() {
		 $('#gu').change(function(){
			$.ajax({
				url : "http://127.0.0.1:8090/bbs/json/result.bbs",
				type : "get",
				data : {},
				success : function(data) {
					var obj = data;
		 			var analysis_result = obj.analysis_result;
			        var comboGu = document.getElementById("gu");
			        
			        $('#dong').children("option").remove();
			        
			        var option = "<option value='전체'>전체</option>";
					 $('#dong').append(option);
					for (var i = 0; i < analysis_result.length; i++) {
						if(analysis_result[i].GU == comboGu.value){	
							 var option = "<option value='" + analysis_result[i].DONG + "'>" + analysis_result[i].DONG + "</option>";
							 $('#dong').append(option);
							}
						} 
					}
				});
			 });
			});

</script>
</html>
	

