<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--
	Gravity by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/reaction.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/popupLayer.css" />
	</head>
	<style>
	.imgbox{
		width: 15em;
		height: 15em;
		overflow: hidden;
		margin: auto;
		margin-bottom: 0.5em;
	}
	
	.fImg{
		width: 100%;
		height: 100%;
		object-fit: cover; 
	}
	</style>
<link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&display=swap" rel="stylesheet">
<style>
* {
	margin: 0;
	padding: 0;
}

#error404_black {
	position: absolute;
	z-index: -1;
}

div {
	text-align: center;
	position: relative;
	z-index: 1;
	width: 100%;
	height: 100vh;
}

h1 {
	font-family: 'Titillium Web', sans-serif;
	font-size: xx-large;
}

p {
	font-family: 'Gothic A1', sans-serif;
	margin: 0 0 1em 0;
	font-size: large;
}
</style>

<body class="is-preload">
	<!-- map 없으면 에러나기 때문에 삭제하지 말것, -->
	<div id="map" hidden=""></div>
	<%-- 
	<!-- Header -->
	<div id="header">
		<h1 id="logo">
			<a href="${pageContext.request.contextPath}/app/board/boardMapPage.jsp">Treat Trip</a>
		</h1>
		<p>
			<img alt="" src="${pageContext.request.contextPath}/images/logos/linkedin_banner_image_1.png">
		</p>
		<nav id="nav">
			<ul>
				<li><a href="${pageContext.request.contextPath}/app/board/boardMapPage.jsp">Home</a></li>
				<li><a href="javascript:location.replace('${pageContext.request.contextPath}/app/board/boardMapPage.jsp')">Mode</a>
					<ul>
						<li><a href="javascript:moveFromOther('around')">Around</a></li>
						<li><a href="${pageContext.request.contextPath}/app/board/search.jsp">Search</a></li>
						<li><a href="javascript:moveFromOther('posting')">Posting</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/member/MemberProfileOpen.me" class="button alt">My Page</a></li>
			</ul>
		</nav>

	</div>

	<!-- main -->
	<section id="main">
		<div class="container" style="width:50%;">

			<div style="width: 100%; display:flex;">
				<div style="width:75%; margin:auto;">
					<div>
						<form action="${pageContext.request.contextPath}/board/SearchBoards.bo" name="searchForm">
							<!-- <span class="fas fa-search"></span> -->
							<div style="display:inline-block; ">
							<input type="text" name="search" id="search" placeholder="글 제목이나 작성자로 검색해보세요." style="width:25em"/>
							</div>
							<div style="display:inline-block; ">
							<input type="submit" id="btn" class="button primary small" value="Search">
							</div>
						</form>
					</div>
				</div>			
			</div>
			<hr>
			
			<div id="searchMenu">
				<div class="icon-grid" style="margin-top: 4em;">
					<div class="row gtr-uniform gtr-150">
						<section class="col-4 col-6-large col-12-small">
								<div class="imgbox" style="background: #BDBDBD;">
									<a href="#layer" class="btn-layer">
										<img class="fImg" src="${pageContext.request.contextPath}/images/11.jpg" alt=""/>
									</a>
								</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</section>	
	
 	<!-- 팝업 게시물 -->
<!-- 	<div id="layerInner"></div> -->  --%>

	<!-- 서비스 준비중 페이지 -->
	<div style="text-align: center; margin-bottom: 1em;">
		<img id="page404" alt="" src="../../images/logos/error/error404_black.png" width="100%" style="opacity: 0.5 !important;">
		<h1>서비스 준비중입니다.</h1>
		<a href="javascript:location.replace('${pageContext.request.contextPath}/app/board/boardMapPage.jsp')" class="button">Back to Homepage</a>
	</div>
	<!-- Footer -->
	<div id="footer" ></div>


	<!-- Scripts -->
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<!-- 지도 API scripts -->
	<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb4dad6fbd5aa76ed4058c995c432933&libraries=services,clusterer,drawing"></script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>
	
	<!-- 기본 스크립트 -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	
	<script src="${pageContext.request.contextPath}/assets/js/kakao/geolocation.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/kakao/kakaoMap.js"></script>
	
	<!-- 레이어 팝업 스크립트 -->
	<script src="${pageContext.request.contextPath}/assets/js/board/layerPopup.js"></script>
	
	<!-- 지도 위치 로딩 스크립트 순서 지정 -->
	<script src="${pageContext.request.contextPath}/assets/js/kakao/mapSequence.js"></script>


	<script>
		mapSequence();
		$(document).ready(function() {
		    $("#searchMenu").load("${pageContext.request.contextPath}/app/board/search/inner_search_boards.jsp");
			/* $("#layerInner").load("${pageContext.request.contextPath}/app/board/search/inner_search.jsp"); */
			$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
		});

		
	</script>
	</body>
</html>