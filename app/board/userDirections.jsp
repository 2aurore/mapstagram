<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--
	Gravity by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Treat Trip</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/reaction.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/directions.css" />
		
		<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
<style>
/* 상단 메뉴바 삭제하기 위한 반응형 디자인 삽입 id 값으로 사용되고 있기 때문에  분리 불가 */
@media ( max-width : 1680px) { #titleBar {display: none;} }
@media ( max-width : 1280px) { #titleBar {display: none;} }
@media ( max-width : 960px) { #titleBar {display: none;} #wrapper{margin: 0 auto;} #wrapper,#slider-wrap,#slider-wrap ul#slider li,.directions {width: 600px; height: 400px;}}
@media ( max-width : 736px) { #titleBar {display: none;} #wrapper{margin: 0 auto;} #wrapper,#slider-wrap,#slider-wrap ul#slider li,.directions {width: 600px; height: 400px;}}
@media ( max-width : 360px) { #titleBar {display: none;} #wrapper{margin: 0 auto;} #wrapper,#slider-wrap,#slider-wrap ul#slider li,.directions {width: 600px; height: 400px;}}

</style>
<body>
	<div id='startTreatTrip'><a href="${pageContext.request.contextPath}/board/MainMapPage.bo" class="button primary">Treat Trip 시작하기!</a></div>
	<div id="wrapper">
	     <div id="slider-wrap">
   		     <ul id="slider">
   		     <!-- 페이지 이용 가이드 img 슬라이드 목록 -->
        	   	<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_01.JPG" class="directions" id="direction_01"></li>
           		<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_02.JPG" class="directions" id="direction_02"></li>
	           	<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_03.JPG" class="directions" id="direction_03"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_04.JPG" class="directions" id="direction_04"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_05.JPG" class="directions" id="direction_05"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_06.JPG" class="directions" id="direction_06"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_07.JPG" class="directions" id="direction_07"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_08.JPG" class="directions" id="direction_08"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_09.JPG" class="directions" id="direction_09"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_10.JPG" class="directions" id="direction_10"></li>
				<li><img src="${pageContext.request.contextPath}/images/tt_directions/direction_11.JPG" class="directions" id="direction_11"></li>
			</ul>	
			<!-- 좌우 화살표 아이콘 -->
			<div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
         	<div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>

		</div>
		
		
	</div>
		<!-- Footer -->
		<div id="footer" >	</div>		
		
		<!-- Scripts -->
			<script>var contextPath = "${pageContext.request.contextPath}"</script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			                                               
		<script src="${pageContext.request.contextPath}/assets/js/board/direction.js"></script>
			
		<!-- footer 연결 스크립트  -->
		<script>
			$(document).ready(function() {
				$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
			});
			
		</script>
	</body>
</html>