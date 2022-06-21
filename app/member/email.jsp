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
	</head>
<style>
	.container {width: 35%; text-align: center; margin: 0 auto;}
	/* 반응형 디자인 삽입  분리 불가 */
	@media ( max-width : 1680px) { #titleBar {display: none;} .container {width: 35%;} }
	@media ( max-width : 1280px) { #titleBar {display: none;} .container {width: 40%;} }
	@media ( max-width : 960px) { #titleBar {display: none;} .container {width: 50%;} }
	@media ( max-width : 736px) { #titleBar {display: none;} .container {width: 70%} }
	@media ( max-width : 360px) { #titleBar {display: none;} .container {width: 70%} }
</style>
	<body class="is-preload">
	
		<!-- main -->
		<section id="main">
			<div class="container" >
			<!-- form -->
			<h3>비밀번호를 잊으셨나요?</h3>
			<p>
				아이디, 이름과 임시 비밀번호를 받으실 이메일 주소를 입력해주세요.
			</p>
			<form method="get" action="${pageContext.request.contextPath}/member/MemberSendEmail.me">
				<div class="row gtr-uniform gtr-50">
					<div class="col-12">
						<input type="text" name="id" id="id" placeholder="아이디" />
					</div>
					<div class="col-12">
						<input type="text" name="name" id="name" placeholder="이름" />
					</div>
					<div class="col-12">
						<input type="email" name="email" id="email" placeholder="이메일" />
					</div>
					<div class="col-12">
						<input type="submit" value="임시 비밀번호 받기" class="button primary small fit" />
					</div>
				</div>
			</form>
		</div>
		</section>

		<!-- Footer -->
			<div id="footer"></div>

		<!-- Scripts -->
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script>
				$(document).ready(function() {
					$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
				})
			</script>
		
			<!-- 기본 스크립트 -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	

	</body>
</html>