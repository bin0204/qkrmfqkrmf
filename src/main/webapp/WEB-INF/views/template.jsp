<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Theme Made By www.w3schools.com -->
  <title>바글바글</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
  <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mxiodqx5gf"></script>
  <!--   카카오맵 -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d9c351ec80a7e5791edf33b41ef8252d"></script> 
  
  <style>
  body {
    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
    color: #818181;
  }
  h2 {
    font-size: 24px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 19px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
  }  
  .jumbotron {
    background-color: #000;
    color: #fff;
    padding: 100px 25px;
    font-family: Montserrat, sans-serif;
  }
  .container-fluid {
    padding: 30px 50px;
  }
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo-small {
    color: #000;
    font-size: 50px;
  }
  .logo {
    color: #000;
    font-size: 200px;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail img {
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #000;
  }
  .carousel-indicators li {
    border-color: #000;
  }
  .carousel-indicators li.active {
    background-color: #000;
  }
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel {
    border: 1px solid #000; 
    border-radius:0 !important;
    transition: box-shadow 0.5s;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
    border: 1px solid #000;
    background-color: #fff !important;
    color: #000;
  }
  .panel-heading {
    color: #fff !important;
    background-color: #000 !important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
  }
  .panel-footer {
    background-color: white !important;
  }
  .panel-footer h3 {
    font-size: 32px;
  }
  .panel-footer h4 {
    color: #aaa;
    font-size: 14px;
  }
  .panel-footer .btn {
    margin: 15px 0;
    background-color: #000;
    color: #fff;
  }
  .navbar {
    margin-bottom: 0;
    background-color: #000;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #000 !important;
    background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  footer .glyphicon {
    font-size: 20px;
    margin-bottom: 20px;
    color: #000;
  }
  .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration: 1s;
    visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
      width: 100%;
      margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
      font-size: 150px;
    }
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">바글바글</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">ABOUT</a></li>
        <li><a href="#services">SERVICES</a></li>
        <li><a href="#portfolio">PORTFOLIO</a></li>
        <li><a href="#pricing">PRICING</a></li>
        <li><a href="#contact">CONTACT</a></li>
      </ul>  
      <a href="#about" id="searchMove" style="visibility: hidden;">네이버</a> 
    </div>
  </div>
</nav> 

<button onclick="document.getElementById('searchMove').click();">검색버튼 누르면 페이지 이동</button>

<div class="jumbotron text-center">	
  <h1>바글바글</h1> 
  <p>바글바글바글바글바글바글</p> 
</div>

<!-- Container (About Section) -->
  <div id="about" class="container-fluid text-center"> 
	  <div class="container-fluid bg-grey" style="margin-bottom: 20px"> 
	     <h2>  Choose</h2>
			<div id="combo" style="margin-left: 20px; margin-right: 20px"> 
				<select id="gu" name="gu" style="width: 200px; margin-right: 30px" > <option>구 · 군</option> </select>
				<select id="dong" name="dong" style="width: 200px; margin-right: 30px"> <option>동 · 읍 · 면</option> </select>
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
				<input id = search type="button" value="확인" style="width: 100px; height: 30px" onclick="document.getElementById('searchMove').click();"/>
			</div>
			<div style="margin-top: 40px; margin-left: 70px; margin-right: 70px">
				<div id = "map" style = "width: 80%; height: 650px;"></div>
			</div>
	  </div>
  </div> 

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
  <div style="margin-top: 70px"> 
	 <h2>장전 2동  </h2>
	 <h4>치킨집 최근 근황</h4>
  </div>
  <br>
  <div class ="row slideanim">
  	<img alt="이미지없음" src = "./resources/bbq.png" align="left"  style="margin-left: 300px" />
<!--   	<div id = "peupChart" style = "width: 700px; height: 400px; float: right; margin-right : 150px; margin-top: 20px"></div> -->
  	<div id="chart_div"></div>
  </div> 
</div> 

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  
  <h2>What our customers say</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
      </div>
      <div class="item">
        <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
      </div>
      <div class="item">
        <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<!-- Container (Pricing Section) -->
<div id="pricing" class="container-fluid">
  <div class="text-center">
    <h2>Pricing</h2>
    <h4>Choose a payment plan that works for you</h4>
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Basic</h1>
        </div>
        <div class="panel-body">
          <p><strong>20</strong> Lorem</p>
          <p><strong>15</strong> Ipsum</p>
          <p><strong>5</strong> Dolor</p>
          <p><strong>2</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$19</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>     
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Pro</h1>
        </div>
        <div class="panel-body">
          <p><strong>50</strong> Lorem</p>
          <p><strong>25</strong> Ipsum</p>
          <p><strong>10</strong> Dolor</p>
          <p><strong>5</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$29</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>Premium</h1>
        </div>
        <div class="panel-body">
          <p><strong>100</strong> Lorem</p>
          <p><strong>50</strong> Ipsum</p>
          <p><strong>25</strong> Dolor</p>
          <p><strong>10</strong> Sit</p>
          <p><strong>Endless</strong> Amet</p>
        </div>
        <div class="panel-footer">
          <h3>$49</h3>
          <h4>per month</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>    
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>Contact us and we'll get back to you within 24 hours.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> Chicago, US</p>
      <p><span class="glyphicon glyphicon-phone"></span> +00 1515151515</p>
      <p><span class="glyphicon glyphicon-envelope"></span> myemail@something.com</p>
    </div>
    <div class="col-sm-7 slideanim">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Send</button>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>@Copyright:바글바글</p>
</footer>

<script>
//------------------------------------------------------------------------------------------------------------------------------------
		$(document).ready(function(){
		  // Add smooth scrolling to all links in navbar + footer link
		  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
		    // Make sure this.hash has a value before overriding default behavior
		    if (this.hash !== "") {
		      // Prevent default anchor click behavior
		      event.preventDefault();
		
		      // Store hash
		      var hash = this.hash;
		
		      // Using jQuery's animate() method to add smooth page scroll
		      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
		      $('html, body').animate({
		        scrollTop: $(hash).offset().top
		      }, 900, function(){
		   
		        // Add hash (#) to URL when done scrolling (default click behavior)
		        window.location.hash = hash;
		      });
		    } // End if
		  });
		  
		  $(window).scroll(function() {
		    $(".slideanim").each(function(){
		      var pos = $(this).offset().top;
		
		      var winTop = $(window).scrollTop();
		        if (pos < winTop + 600) {
		          $(this).addClass("slide");
		        }
		    });
		  });
		})
//---------------------------------------------------------------------------------------------------------------------------------------
		
// 폐업률 그래프------------------------------------------------------------------------------------------------------------
// 	var chart1 = c3.generate({
// 		bindto : '#peupChart',
// 		data: {
// 		        columns: 
// 		           	[]
// 		        ,
// 	        type: 'bar'
// 	    },
// 	    bar: {
// 	        width: {
// 	            ratio: 0.3 // this makes bar width 50% of length between ticks
// 	        }
// 	    }
// 	});


		  
//---------------------------------------------------------------------------------------------------------------------------------------
		
	
// 직종별 파이차트------------------------------------------------------------------------------------------------------------
	var chart = c3.generate({
		bindto : '#chart',
		data : {
			columns :[], 
			type : 'pie'
		},
	});  
	
	 

// 조회 버튼 누르면 그래프 그리기------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------
	
					for (var i = 0; i < analysis_store_peup.length; i++) {
						if ( comboType.value == analysis_store_peup[i].TYPE && comboDong.value == analysis_store_peup[i].DONG) {
// 							peup += "['1년 이내'," + analysis_store_peup[i].YEAR1 + "],";
// 							peup += "['1~2년 이내'," + analysis_store_peup[i].YEAR2+ "],";
// 							peup += "['2~3년 이내'," + analysis_store_peup[i].YEAR3 + "]";
							peup +=  analysis_store_peup[i].YEAR1 + ",";
							peup +=  analysis_store_peup[i].YEAR2+ ",";
							peup +=  analysis_store_peup[i].YEAR3;
						}	
					}
//-------------------------------------------------------------------------------------------------------------------------
					col += "]";
					peup += "]";
								
//-------------------------------------------------------------------------------------------------------------------------------
					var html = "";
					html += "<table border=1>"
					html += "<tr>"; 
					html += "<td>" + col + "</td>";
					html += "<td>" + sang + "</td>";
					html += "<td>" + peup + "</td>";
					html += "</tr>";
					html += "</table>";
// 					$("#combo").append(html);
//------------------------------------------------------------------------------------------------------------------------------------
					
// 직종별 파이차트 새로고침---------------------------------------------------------------------------------------------------------------------
					setTimeout(function () {
					    chart.load({
					        columns: 
					            eval(col)
					    	});
					    }, 300); 
					    
// 특정 직종의 1~3년 폐업률 그래프 바 새로고침------------------------------------------------------------------------------------------------				
// 					setTimeout(function () {
// 					    chart1.load({
// 					        columns: 
// 					        	eval(peup)
// 					    	});
// 					    }, 300);
					
  google.charts.load('current', {packages: ['corechart', 'bar']});
  google.charts.setOnLoadCallback(drawBasic);  
  
  function drawBasic() {
  
        var data = google.visualization.arrayToDataTable([
          ['City', '2010 Population',],
          ['New York City, NY', 8175000],
          ['Los Angeles, CA', 3792000],
          ['Chicago, IL', 2695000],
          ['Houston, TX', 2099000],
          ['Philadelphia, PA', 1526000]
        ]);
  
        var options = {
          title: 'Population of Largest U.S. Cities',
          chartArea: {width: '50%'},
          hAxis: {
            title: 'Total Population',
            minValue: 0
          },
          vAxis: {
            title: 'City'
          }
        };
  
        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
  
        chart.draw(data, options);
      }
//------------------------------------------------------------------------------------------------------------------------------------------
 				}
			});
// 영업중인 가게 불러오기 ajax ---------------------------------------------------------------------------------------------------
			$.ajax({
				url : "http://127.0.0.1:8090/bbs/json/store.bbs",
				type : "get", //get post둘중하나
				data : {},
				success : function(data) {
					var obj = data;
					var store = obj.store;
					
					var comboGu = document.getElementById("gu");
					var comboDong = document.getElementById("dong");
					var comboType = document.getElementById("type");
					var col = "["; 
					var map_x;
					var map_y;
					var sang;
					var store_name;
// 					var map = "[";
					var map_xy ="["; 
					
					for (var i = 0; i < store.length; i++) {
						if (comboGu.value==store[i].GU ) {
							if ( comboDong.value == store[i].DONG) {
								if(comboType.value == store[i].STORE_TYPE){
									var gu = store[i].GU;
									var dong = store[i].DONG;
									
									map_x= store[i].X;
									map_y= store[i].Y;
									store_name = store[i].STORE_NAME;
									
									if(map_xy == "[")
										map_xy += "{title: '"+ store_name +"',latlng: new kakao.maps.LatLng(" + map_x + "," + map_y + ")}";
									else
										map_xy += ",{title: '"+ store_name +"',latlng: new kakao.maps.LatLng(" + map_x + "," + map_y + ")}";
								}
								
							}
							else if (comboDong.value == "전체") { 
								var gu = store[i].GU;
								var dong = store[i].DONG;
								
								map_x= store[i].X;
								map_y= store[i].Y;
								 
								if(map_xy == "[")
									map_xy += "{title: '"+ store_name +"',latlng: new kakao.maps.LatLng(" + map_x + "," + map_y + ")}";
								else
									map_xy += ",{title: '"+ store_name +"',latlng: new kakao.maps.LatLng(" + map_x + "," + map_y + ")}";
							} 
						}
					}
					
					map_xy += "]";
								
//------------------------------------------------------------------------------------------------------------------------------------------
					
					var html = "";
					html += "<table border=1>"
					html += "<tr>";
					html += "<td>" + map_xy + "</td>";
					html += "</tr>";
					html += "</table>";
// 					$("#combo").append(html);

// ---------------------지도 출력 ----------------------------------------------------------------------------------------------------------------
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					mapOption = { 
					    center: new kakao.maps.LatLng(35.231715, 129.084744), // 지도의 중심좌표 
					    level: 3 // 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					//마커를 표시할 위치와 title 객체 배열입니다 
					var positions = eval(map_xy); 
					//마커 이미지의 이미지 주소입니다
					var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				 
					for (var i = 0; i < positions.length; i ++) {
					
					// 마커 이미지의 이미지 크기 입니다
					var imageSize = new kakao.maps.Size(24, 35); 
					
					// 마커 이미지를 생성합니다   
					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
					
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
					    map: map, // 마커를 표시할 지도
					    position: positions[i].latlng, // 마커를 표시할 위치
					    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					    image : markerImage // 마커 이미지 
					});
					}
				///////////////////////////////////////////////////////////////////////////////
					
 				}
			});
//---------가게 불러오기 ajax 끝------------------------------------------------------------------------------------------------------------------
			return false; //자기자신이 submit이나 뭔가 실행하는기능이 있다면 그것을 막고 위에 내용만 실행  --- ajax 두개 끝
		});
	});

//-----검색 버튼 클릭 구현끝 ------------------------------------------------------------------------------------------------------------------------


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
</body>
</html>
    