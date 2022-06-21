<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Treat Trip</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/reaction.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/popupLayer.css" />
	</head>

	<body class="landing is-preload">
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
	
	<!-- Main -->
		<section id="main" class="wrapper style1 special">
			<div class="container" style="width:50%;" id="profileMain">
				<div style="width: 100%">
					<div id="profileInfo" style="width: 100%; text-align:center;">
						<div class="box" style="background: #BDBDBD; margin-left: 20%">
							<img class="profile" src="${pageContext.request.contextPath}${mInfo.getMember_picture()}" alt=""/>
						</div>
						<div class="text" style="width: 65%; margin-left:auto">
							<section>
								<p style="font-size:150%"> ${member_id} &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/app/board/profile/pSet/profileSet_checkPw.jsp" id="btn1" class="button small" style="font-size:50%">프로필 편집</a></p>
								<p>친구 <b>${myfriendCnt}</b>&nbsp;&nbsp;게시물 <b>${myboardCnt}</b></p>
								<p>${mInfo.getMember_name()} &nbsp;&nbsp;<a href="${pageContext.request.contextPath}/member/MemberLogOut.me" onclick="return clickLogout();" style="color:#292929; font-size: 80%;">로그아웃</a></p>
							</section>
						</div>
					</div>
				</div>
				<hr>
				<ul class="icons" >
					<li><a href="#" onclick="changeMyProfileMenu('board')"><span class="label">게시물</span></a></li>
					<li><a href="#" onclick="changeMyProfileMenu('friend')"><span class="label">친구</span></a></li>
					<li><a href="#" onclick="changeMyProfileMenu('info')"><span class="label">정보</span></a></li>
					<%--<li><a href="#" onclick="changeMyProfileMenu('menu4')"><span class="label">메뉴4</span></a></li> --%>
				</ul>
				<br>
				
				<div id="menu"></div>
				
			</div>
		</section>

	<!-- Footer -->
	<div id="footer"></div>
	
		<!-- Scripts -->
			<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
			<script> var member_id = "${member_id}"</script>
		
			<!-- 기본 스크립트 -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

			<!-- 게시글 댓글 달기 스크립트 -->	
			<script src="${pageContext.request.contextPath}/assets/js/board/replyAction.js"></script>
			<!-- member들의 프로필과 관련된 javascript -->
			<script src="${pageContext.request.contextPath}/assets/js/member/profilePage.js"></script>
			
			<script>
				function clickLogout(){
					if(!confirm('로그아웃 하시겠습니까?')){
						return false;
					}
				}
			</script>			

			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script>
				var contextPath = "${pageContext.request.contextPath}";
				//첫 불러오기
				$(document).ready(function() {
					$("#menu").load("${pageContext.request.contextPath}/app/board/profile/pMenu/inner_p_board.jsp");
					$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
				})
				
				/* //버튼 누른후 불러오기
				function changeMenu(num){
					
					if(num == 1){
						$(document).ready(function() {
							$("#menu").load("pMenu/inner_p_board.jsp")
						});
					}else if(num == 2){
						$(document).ready(function() {
							$("#menu").load("pMenu/inner_p_friend.jsp")
						});
					}else if(num == 3){
						$(document).ready(function() {
							$("#menu").load("pMenu/inner_p_info.jsp")
						});
					}else if(num == 4){
						$(document).ready(function() {
							$("#menu").load("pMenu/inner_p_menu4.jsp")
						});
					};
					
				} */

			</script>
			

	</body>
</html>