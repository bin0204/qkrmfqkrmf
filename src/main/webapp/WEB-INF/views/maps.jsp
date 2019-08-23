<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=mxiodqx5gf"></script>
</head>
<body>
	<div id="map" style="width: 1000px; height: 600px;" align="center"></div>

	<script> 
	var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(35.230591, 129.086550),
	    zoom: 11,
	    scaleControl: false,
	    logoControl: false,
	    mapDataControl: false,
	    zoomControl: true,
	    minZoom: 1
	    });

	var polygon = new naver.maps.Polygon({
	    map: map,
	    paths: [
	        [
	            new naver.maps.LatLng(35.235640, 129.085519),
	            new naver.maps.LatLng(35.235000, 129.089027),
	            new naver.maps.LatLng(35.233467, 129.089274),
	            new naver.maps.LatLng(35.232485, 129.088952),
	            new naver.maps.LatLng(35.231083, 129.089006),
	            new naver.maps.LatLng(35.229216, 129.089156),
	            new naver.maps.LatLng(35.227419, 129.088567),
	            new naver.maps.LatLng(35.229329, 129.083811)
	        ]
	    ],
	    fillColor: '#256ac4',
	    fillOpacity: 0.3,
	    strokeColor: '#256ac4',
	    strokeOpacity: 0.6,
	    strokeWeight: 3
	}); 

	</script>
	<img alt="이미지없음" src = "./resources/hakjum.jpg" align="center"/> 
	 

	
</body>
</html>