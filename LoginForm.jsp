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
<style>

/* 반응형 디자인 삽입  분리 불가 */
.container {width: 30em; margin-left: 55%;}
@media ( max-width : 1680px) { #titleBar {display: none;} .container {width: 20em; margin-left: 55%;}}
@media ( max-width : 1280px) { #titleBar {display: none;} .container {width: 20em; margin-left: 45%;}}
@media ( max-width : 960px) { #titleBar {display: none;} .container {width: 20em; margin-left: 35%;}}
@media ( max-width : 736px) { #titleBar {display: none;} .container {margin: 0 auto; width: 70%}}
@media ( max-width : 360px) { #titleBar {display: none;} .container {margin: 0 auto; width: 70%}}

</style>
<body class="landing is-preload">

		<!-- main -->
		<section id="main">
			<div class="container" >			
				<!-- form -->
				<section>
					<img src="images/logo.png" alt="" style="width:100%"/>
					<form method="post" action="${pageContext.request.contextPath}/member/MemberLoginOk.me"  name="loginForm">
						<div class="row gtr-uniform gtr-50">
							<div class="col-12">
								<input type="text" name="id" id="id" value="" placeholder="Id" />
							</div>
							<div class="col-12">
								<input type="password" name="pw" id="pw" value="" placeholder="Password" />
							</div>
							<div class="col-12">
								<input type="submit" value="Login" class="button primary small fit" />
							</div>
							<br>
							<br>
							
							<div class="col-12">
							<ul class="alt" style="text-align:center;">
								<li><div id="loginText1">
									<a href="${pageContext.request.contextPath}/app/member/email.jsp" >비밀번호를 잊으셨나요?</a><br>
								</div></li>
								<li><div  id="loginText2">
									<a href="javascript:openJoin()">새 계정 만들기</a>
								</div></li>
							</ul>
							</div>
						</div>
					</form>
				</section>
			</div>
		</section>

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
			                                               
		<script src="${pageContext.request.contextPath}/assets/js/member/popJoinPage.js"></script>
			
		<!-- footer 연결 스크립트  -->
		<script>
			$(document).ready(function() {
				$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
			});
			
		</script>
	</body>
</html>