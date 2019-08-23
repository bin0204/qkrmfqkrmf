<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<title>바글바글</title>
	<style>
   		input.test {
   			background: url('./resources/arrows.png') 0 0 no-repeat;
   		}
    </style>
</head>

<body>
    <div class=" w3-display-middle">
      <h1 class="w3-xxxlarge w3-animate-top">어디서 하실계획이세요?</h1>
      <div class="w3-center">
      <div class="w3-bar">
       	<div id="combo"> 
       		<div class="w3-row-padding">
	       		<form action="BBSServlet" method="post" enctype="UTF-8">
					<select class="w3-third w3-select w3-medium" id="gu" name="gu"> 
						<option>구·군</option>	
					</select>
					<select class="w3-third w3-select w3-medium" id="dong" name="dong"> 
						<option>동·읍·면</option>  
					</select> 
					<img alt="확인" class="w3-button" src="./resources/a.png" onclick="document.getElementById('submit').click();">
					<input type="submit" id ="submit" style = "visibility: hidden;">
	       		</form>
			</div>
		</div>
	
		<script>
		// <구·군> 콤보박스 띄우기---------------------------------------------------------------------------------------------------------
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
					
	// <동·읍·면> 동적콤보박스 띄우기---------------------------------------------------------------------------------------------------------
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
	//---------------------------------------------------------------------------------------------------------------------------------------
		
	//---------------------------------------------------------------------------------------------------------------------------------------

	</script>
        </div>
 	  </div>
   	 </div>
    <footer class="w3-container w3-black w3-center w3-display-bottommiddle" style="width:100%">
      <p class="w3-text-white">@Copyright : 바글바글</p>
    </footer>
</body>
</html>
