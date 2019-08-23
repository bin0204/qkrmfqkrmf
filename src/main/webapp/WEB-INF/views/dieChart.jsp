
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

<!-- 구글차트 api -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 지도 API -->
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mxiodqx5gf"></script>

</head>
<style> 
	
</style>
<body>
<form action="">
	<div id="combo"> 
		<select id="gu" name="gu" style="width: 200px; margin-right: 30px" > <option>구·군</option> </select>
		<select id="dong" name="dong" style="width: 200px; margin-right: 30px"> <option>동·읍·면</option> </select>
		<select id="type" name="type" style="width: 200px; margin-right: 30px"> 
			<option value="닭/오리요리">닭/오리요리</option> 
			<option value="분식">분식</option> 
			<option value="양식">양식</option> 
			<option value="유흥주점">유흥주점</option> 
			<option value="일식/수산물">일식/수산물</option> 
			<option value="중식">중식</option> 
			<option value="한식">한식</option> 
			<option value="기타">기타</option>  
		</select>
		<input id = search type="button" value="확인" style="width: 100px; height: 30px"/>
	</div>
</form>

	<div id = "map" style = "width: 100%; height: 650px; margin-left: 40px; margin-top: 40px;"></div>
	<div id = "chart" style = "width: 700px; height : 600px;"></div> 
	<div id = "peupChart" style = "width: 700px;"></div>
</body>
 
<script> 
	// 폐업률 그래프
	var chart1 = c3.generate({
		bindto : '#peupChart',
		data: {
		        columns: 
		           	[]
		        ,
	        type: 'bar'
	    },
	    bar: {
	        width: {
	            ratio: 0.3 // this makes bar width 50% of length between ticks
	        }
	    }
	});
	
	// 직종별 파이차트
	var chart = c3.generate({
		bindto : '#chart',
		data : {
			columns :[], 
			type : 'pie'
		},
	});  

	// 조회 버튼 누르면 그래프 그리기
	$(document).ready(function() {
		$("#search").click(function() {
			if(document.getElementById("gu").value == "구·군")
				alert("구 · 군을 선택하세요");
			else
			$.ajax({
				url : "http://127.0.0.1:8090/bbs/json/result.bbs",
				type : "get", //get post둘중하나
				data : {},
				success : function(data) {
					var obj = data;
					var analysis_result = obj.analysis_result;
					var analysis_store_peup = obj.analysis_store_peup; 
					var comboGu = document.getElementById("gu");
					var comboDong = document.getElementById("dong");
					var comboType = document.getElementById("type");
					var col = "["; 
					var map_x;
					var map_y;
					var sang;
					
					var peup = "[";
					
					for (var i = 0; i < analysis_result.length; i++) {
						if (comboGu.value==analysis_result[i].GU ) {
							if ( comboDong.value == analysis_result[i].DONG) {
									var gu = analysis_result[i].GU;
									var dong = analysis_result[i].DONG;
									var result2 = Math.round(analysis_result[i].CHICKEN * 100);
									var result3 = Math.round(analysis_result[i].BUNSIK* 100);
									var result4 = Math.round(analysis_result[i].YANGSIK* 100);
									var result5 = Math.round(analysis_result[i].BAR* 100);
									var result6 = Math.round(analysis_result[i].FISH* 100);
									var result7 = Math.round(analysis_result[i].CHINA* 100);
									var result8 = Math.round(analysis_result[i].KOREAN* 100);
									var result9 = Math.round(analysis_result[i].ETC* 100);
									map_x= analysis_result[i].MAP_X;
									map_y= analysis_result[i].MAP_Y;
									sang = analysis_result[i].RESULT1;
									
									col += "['닭/오리요리'," + result2+ "],";
									col += "['분식'," + result3+ "],";
									col += "['양식'," + result4+ "],";
									col += "['유흥주점'," + result5+ "],";
									col += "['일식/수산물'," + result6+ "],";
									col += "['중식'," + result7+ "],";
									col += "['한식'," + result8+ "],";
									col += "['기타'," + result9+ "]";
								
							}
							else if (comboDong.value == "전체") { 
								var gu = analysis_result[i].GU;
								var dong = analysis_result[i].DONG;
								var result2 = analysis_result[i].RESULT2;
								var result3 = analysis_result[i].RESULT3;
								var result4 = analysis_result[i].RESULT4;
								
								if(col=="[")
									col += "['" + dong + "'," + result2+ "," + result3+ "," + result4 + "]";
								else
									col += ",['" + dong + "'," + result2+ "," + result3+ "," + result4 + "]"; 
							} 
						}
					}
					///-------------------------------------------------------------------

					for (var i = 0; i < analysis_store_peup.length; i++) {
						if ( comboType.value == analysis_store_peup[i].TYPE && comboDong.value == analysis_store_peup[i].DONG) {
							peup += "['1년 이내'," + analysis_store_peup[i].YEAR1 + "],";
							peup += "['1~2년 이내'," + analysis_store_peup[i].YEAR2+ "],";
							peup += "['2~3년 이내'," + analysis_store_peup[i].YEAR3 + "]";
						}	
					}
					///-------------------------------------------------------------------
					col += "]";
					peup += "]";
								
					//--------------------------------------------------------------------------
					var html = "";
					html += "<table border=1>"
					html += "<tr>"; 
					html += "<td>" + col + "</td>";
					html += "<td>" + sang + "</td>";
					html += "<td>" + peup + "</td>";
					html += "</tr>";
					html += "</table>";
// 					$("#combo").append(html);
					//-----------------------------------------
					
					//지도 출력 -----------------------------------
					var map = new naver.maps.Map('map', {
					    center: new naver.maps.LatLng(35.230591, 129.086550),
					    zoom: 11,
					    scaleControl: false,
					    logoControl: false,
					    mapDataControl: false,
					    zoomControl: true,
					    minZoom: 1
					    });

					// 직종별 파이차트 새로고침------------------------------------------
					setTimeout(function () {
					    chart.load({
					        columns: 
					            eval(col)
					    	});
					    }, 300);
					    
					// 특정 직종의 1~3년 폐업률 그래프 바 새로고침------------------------------------------				
					setTimeout(function () {
					    chart1.load({
					        columns: 
					        	eval(peup)
					    	});
					    }, 300);
					
					//------------------------------------------------------------------------------------
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
	//---------------------------------------------------------------------------------
	
	//---------------------------------------------------------------------------------

</script>
</html>
	

