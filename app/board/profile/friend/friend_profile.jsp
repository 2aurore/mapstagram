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
	</head>
	<body class="landing is-preload">
	<c:set var="friend" value="${friend}"/>
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
						<%--<li><a href="javascript:moveFromOther('around')">Around</a></li> --%>
						<li><a href="${pageContext.request.contextPath}/app/board/search.jsp">Search</a></li>
						<li><a href="javascript:mapPostingMode()">Posting</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/member/MemberProfileOpen.me" class="button alt">My Page</a></li>
			</ul>
		</nav>

	</div>
	
	<!-- Main -->
		<section id="main" class="wrapper style1 special">
			<div class="container" style="width:50%;" id="profileMain">
	
				<div style="width: 100%">
					<div id="profileInfo" style="width: 100%; text-align:center;">
						<div class="box" style="background: #BDBDBD; margin-left: 20%">
							<img class="profile" src="${pageContext.request.contextPath}/${friend.getMember_picture()}" alt=""/>
						</div>
						<div class="text" style="width: 65%; margin-left:auto">
							<section>
								<p style="font-size:150%">${friend.getMember_id()} &nbsp &nbsp </p>
								<p>친구 <b>${friend_cnt}</b>&nbsp &nbsp 게시물 <b>${board_cnt}</b></p>
								<p>${friend.getMember_name()} &nbsp &nbsp</p>
							</section>
						</div>
					</div>
				</div>
				<hr>
				<ul class="icons" >
					<li><a href="#" onclick="changeFriendMenu(1)"><span class="label">메뉴1</span></a></li>
					<li><a href="#" onclick="changeFriendMenu(2)"><span class="label">친구</span></a></li>
					<li><a href="#" onclick="changeFriendMenu(3)"><span class="label">메뉴3</span></a></li>
					<li><a href="#" onclick="changeFriendMenu(4)"><span class="label">메뉴4</span></a></li>
				</ul>
				<br>
				
				<div id="menu">
			
				</div>
				
			</div>
		</section>

	<!-- Footer -->
	<div id="footer"></div>

	<!-- Scripts -->
	<!-- 지도 API scripts -->
	<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb4dad6fbd5aa76ed4058c995c432933&libraries=services,clusterer,drawing"></script>
	
	<script src="${pageContext.request.contextPath}/assets/js/kakao/geolocation.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/kakao/kakaoMap.js"></script>

	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

	<!-- 기본 스크립트 -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	
	<!-- member들의 프로필과 관련된 javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/member/profilePage.js"></script>

	<!-- 지도 위치 로딩 스크립트 순서 지정 -->
	<script src="${pageContext.request.contextPath}/assets/js/kakao/mapSequence.js"></script>

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
		})
		
		$(document).ready(function() {
			$("#menu").load("fMenu/inner_f_menu1.jsp")
		});

		

	</script>
			

	</body>
</html>