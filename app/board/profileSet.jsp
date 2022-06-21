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
		<title>Treat Trip</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/reaction.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/fileBtn.css" />
	</head>

	<body class="is-preload">

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
					<!-- 폴더 경로 변경 시 search.jsp에서 사용한 메소드 재사용하여 페이지이동 가능 -->
						<%--<li><a href="javascript:moveFromOther('around')">Around</a></li> --%>
						<li><a href="${pageContext.request.contextPath}/app/board/search.jsp">Search</a></li>
						<li><a href="javascript:moveFromOther('posting')">Posting</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/member/MemberProfileOpen.me" class="button alt">My Page</a></li>
			</ul>
		</nav>

	</div>
	<!-- 프로필 편집 -->
		<section id="main">
			<div class="container" style="text-align:center" id="prfContainer">
				<div id="lists" style="display:inline-block; vertical-align:top; width:200px;">
					<ul style="width:200px; list-style-type : none; text-align:left" >
						<li><a href="javascript:changeProfileSet('')" class="changeProfilePage" id="profile" >&nbsp;프로필 편집</a></li>
						<li><a href="javascript:changeProfileSet('_changePw')" class="changeProfilePage" id="profile_changePw">&nbsp;비밀번호 변경</a></li>
						<li><a href="javascript:changeProfileSet('_inputInfo')" class="changeProfilePage" id="profile_inputInfo">&nbsp;추가 정보 입력</a></li>
					</ul>
				</div>
				
				<div id="profileMain">
					<div id="profileFrm"></div>
				</div>
				
			</div>
		</section>

	<!-- Footer -->
		<div id="footer"></div>


	<!-- Scripts -->
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
	

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>

	<script>
		$(document).ready(function() {
			loadProfileSet('');
			$("#profileFrm").load("${pageContext.request.contextPath}/app/board/profile/pSet/inner_profileSet.jsp");
			$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
		});
	</script>
	</body>
</html>