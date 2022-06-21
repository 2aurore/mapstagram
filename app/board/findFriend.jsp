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
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/reaction.css" />
	</head>
	<style>
	.imgbox{
		width: 4em;
		height: 4em;
		border-radius: 70%;
		overflow: hidden;
		float: left;
		padding: 0;
		margin-top: auto;
		margin-left: 0;
	}
	
	.fImg{
		width: 100%;
		height: 100%;
		object-fit: cover; 
	}
	.friendBox{
		text-align: left;
		display: flex;
	}

	.friendBox .addfriendbox{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: auto;
		display: block;
	}
	
	.friendBox .fname, .fid{
		margin-left: 2em;
	}
	
	#friendcontent hr{
		margin: 1em 0;
	}
	#inner_friendbar a, p, input{
		color: white;
	}

	#inner_friendbar #addFriendBtn{
		font-size: 50%;
		margin-left: 2em;
	}
	</style>
	
		
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
						<li><a href="javascript:moveFromOther('around')">Around</a></li>
						<li><a href="${pageContext.request.contextPath}/app/board/search.jsp">Search</a></li>
						<li><a href="javascript:moveFromOther('posting')">Posting</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/member/MemberProfileOpen.me" class="button alt">My Page</a></li>
			</ul>
		</nav>

	</div>
	
	<!-- map 없으면 에러나기 때문에 삭제하지 말것, -->
	<div id="map"></div>
		<section id="main" class="wrapper style1 special">
			<div class="container" style="display: flex;">
			
				<div id="inner_friendbar" style="width: 30%; background-color: gray; height: inherit; ">
					<div style="margin-top: 10%; margin-left: 5%; margin-right: 5%;">
					
						<div class="content">
							<div style="float:left; width:75%;">
								<input type="text" name="search" id="search" placeholder="search" style="color: white;"/>
							</div>
							
							<div style="float:right; width:25%;">
								<input type="button" value="search" class="button primary small" 
								onclick="searchFriendName('${member_id}');"
								style="width: 80%; padding: 0; margin-top: 3%"/>
							</div>
						</div>
						<br>
						<br>
						
						
						
						<div id="friendcontent">
							<h3 id="friendBarText" style="text-align: left;">알 수도 있는 사람</h3>
							<div id="ff_list">
							<c:set var="ffcnt" value="${requestScope.ffcnt}"/>
								<c:choose>
									<c:when test="${ffcnt != 0}">
										<c:forEach var="fflist" items="${requestScope.ff_Set}" varStatus="status">
										
										<div id="f">
											<div class="friendBox" id="friendBox">
												<div class="imgbox" style="background: #BDBDBD;">
													<a href="javascript:openF_profile()" class="">
														<img class="fImg" src="${pageContext.request.contextPath}/${fflist.getMember_picture()}" alt=""/>
													</a>
												</div>
												
												<div class="infobox">
													<a id="fname" class="fname" onclick="openF_profile()">${fflist.getMember_name()}</a>
													<br>
													<a id="fid" class="fid" onclick="openF_profile()">${fflist.getMember_id()}</a>
												</div>
												<div class="addfriendbox">
													<a href="${pageContext.request.contextPath}/member/MemberFriendRequestAction.me?send_id=${member_id}&receive_id=${fflist.getMember_id()}" id="addFriendBtn" class="button small">친구추가</a>
												</div>
											</div>
											<hr>
										</div>
										
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p id="test1">검색해보셈</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
							
							
			
					</div>
				</div>
				
				<div class="inner" id="inner_friend" style="width: 80%;">
					<div id="friend_profile">
						<p>보고싶은 친구 선택</p>
					</div>
				</div>
				
			</div>
		</section>


	<!-- Footer -->
	<div id="footer"></div>




	<!-- Scripts -->
	<script>var contextPath = "${pageContext.request.contextPath}"</script>
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

	<script src="${pageContext.request.contextPath}/assets/js/member/profilePage.js"></script>

	<!-- 지도 위치 로딩 스크립트 순서 지정 -->
	<script src="${pageContext.request.contextPath}/assets/js/kakao/mapSequence.js"></script>

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
	/* footer불러오기 */
	$(document).ready(function() {
		$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
	})
	
	function openF_profile(){
		$(document).ready(function() {
			$("#friend_profile").load("profile/friend/inner_re_profile.jsp");
		})
	}
	function changeMenu(num){
		
		if(num == 1){
			$(document).ready(function() {
				$("#menu").load("profile/friend/fMenu/inner_f_menu1.jsp")
			});
		}else if(num == 2){
			$(document).ready(function() {
				$("#menu").load("profile/friend/fMenu/inner_f_menu2.jsp")
			});
		}else if(num == 3){
			$(document).ready(function() {
				$("#menu").load("profile/friend/fMenu/inner_f_menu3.jsp")
			});
		}else if(num == 4){
			$(document).ready(function() {
				$("#menu").load("profile/friend/fMenu/inner_f_menu4.jsp")
			});
		};
		
	}

	</script>
	

	</body>
</html>