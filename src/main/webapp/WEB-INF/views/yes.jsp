<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <style>
	.w3-animate-show {
		animation: show 0.8s;
		animation-fill-mode:forwards;
	}
	@keyframes show {
		0%{opacity:1}
        100%{opacity:0}
	}

	.grid-container {
	  display: grid;
	  grid-gap: 10px;
	  background-color: #fff;
	  margin-top: 100px;
	  height: 30px;
	  padding: 20px;
	  margin-left:100px;
	  margin-right: 100px;
	}
	.grid-item {
	  text-align: center;
	  padding: 50px;
	  font-size: 30px;
	  -webkit-animation:scaledown 1s linear;
	  -moz-animation:scaledown 1s linear;
	  animation:scaledown 1s linear;
	  transform-origin:50% 50%;
	  animation-fill-mode: forwards;
	}
	.grid-item:hover{
	   z-index:100;
	  -webkit-animation:scale 1s linear;
	  -moz-animation:scale 1s linear;
	  animation:scale 1s linear;
	  transform-origin:50% 50%;
	  animation-fill-mode: forwards;
  	}
	.item1 {
	  background-color: #f0ae8c;
	  grid-column: 1 / span 2;
	  grid-row: 2;
	}
	.item2 {
	  background-color: #de6a6c;
	  grid-column: 3;
	  grid-row: 2;
	}
	.item3 {
	  background-color: #ed8b70;
	  grid-column: 1/ span 1;
	  grid-row: 1;
	}
	.item4 {
	  background-color: #f8b195;
	  grid-column: 2/ span 3;
	  grid-row: 1;
	}
	.item5 {
	  background-color: #ff847c;
	  grid-column: 1/5;
	  grid-row: 3;
	}
	.item6 {
	  background-color: #ffd3b5;
	  grid-row: 1/ span 3;
	}
	.item7 {
	    background-color: #ede574;
		grid-colum: 4/span 5;
		grid-row:2;
	}
	.item8 {
		background-color: #f9cdad;
		grid-column: span 5;
		grid-row: 4;
	}
	
	@keyframes scale{
	  0%{
	    transform:scale(1.0);
	  }
	  100%{
	   transform:scale(1.1);
	   -webkit-box-shadow: 10px 10px 60px 10px rgba(0,0,0,0.1);
	   -moz-box-shadow: 10px 10px 60px 10px rgba(0,0,0,0.1);
	   box-shadow: 10px 10px 60px 10px rgba(0,0,0,0.1);
	  }
	}
	@keyframes scaledown{
	  0%{
	    transform:scale(1.1);
	  }
	   100%{
	    transform:scale(1.0);
	  }
	}
</style>

<title>바글바글</title> 
</head>
<body>	
	<div class=" w3-display-topmiddle"><h1 class="w3-xxlarge w3-animate-top">어떤 직종을 계획하고 계세요?</h1></div>
	<div class="grid-container w3-animate-opacity"><div class="content"></div>
	  <div class="grid-item item1">일식/수산물</div>
	  <div class="grid-item item2">분식</div>
	  <div class="grid-item item3">유흥주점</div>  
	  <div class="grid-item item4">닭/오리요리</div>
	  <div class="grid-item item5">중식</div>
	  <div class="grid-item item6">기타</div>
	  <div class="grid-item item7">양식</div>
	  <div class="grid-item item8">한식</div>
	</div>
</body>
</html>