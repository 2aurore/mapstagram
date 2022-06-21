<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
						<li><a href="javascript:moveFromOther('around')">Around</a></li>
						<li><a href="${pageContext.request.contextPath}/app/board/search.jsp">Search</a></li>
						<li><a href="javascript:moveFromOther('posting')">Posting</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/app/board/profile.jsp" class="button alt">My Page</a></li>
			</ul>
		</nav>

	</div>
	<!-- 비밀번호 확인 -->
		<section id="main">
			<form method="post" id="profileContainer" action="${pageContext.request.contextPath}/app/board/profileSet.jsp" style="margin:0 auto" name="checkPwForm">
				<div style="text-align:center; margin-top:5em"> 
					<h4>본인 확인을 위해 비밀번호를 입력해 주세요</h4>
					<input type="password" id="input_pw" name="input_pw" style="width:20em; margin:0 auto"><br>
					<input type="submit" value="확인" class="button primary" onclick="return prf_checkPw();">
				</div>							
			</form>
			
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

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<script>
		$(document).ready(function() {
			$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
		});
	</script>
	<script>
		function prf_checkPw(){
			var frm = document.checkPwForm;
			
			if(frm.input_pw.value != ${mInfo.getMember_pw()}){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			frm.submit();
		}
	</script>
	
	</body>
</html>