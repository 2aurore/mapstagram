<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page import="com.treatTrip.app.board.dao.MapPositionDAO" %>
<!DOCTYPE html>
<!-- 게시글이 등록된 핀을 생성할 홈페이지의 메인 지도 페이지 -->
<html>
<head>
	<title>Treat Trip</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/reaction.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/popupLayer.css" />
</head>
<style>
button {padding: 0;}
</style>

<body class="is-preload">
	<!-- 로그인 상태가 아닐 경우 로그인 폼으로 이동 -->
	<c:if test="${member_id eq null}">
		<script>
			alert("로그인 후 이용해주세요");
			location.replace("${pageContext.request.contextPath}/LoginForm.jsp");
		</script>
	</c:if>
	<div id="header">
		<h1 id="logo">
			<a href="${pageContext.request.contextPath}/app/board/boardMapPage.jsp">Treat Trip</a>
		</h1>
		<%-- <p>
			<img alt="" src="${pageContext.request.contextPath}/images/logos/linkedin_banner_image_1.png">
		</p> --%>
		<!-- 상단 메뉴 바 목록 -->
		<nav id="nav">
			<ul>
				<li><a href="${pageContext.request.contextPath}/app/board/boardMapPage.jsp">Home</a></li>
				<li><a href="#">Mode</a>
					<ul>
						<%-- <li><a href="javascript:mapAroundMode()">Around</a></li> --%><%-- 해당 페이지 추후 구현 예정 --%>
						<!-- search 페이지 이동 방식 frontcontroller 사용하여 업데이트 필요 -->
						<li><a href="javascript:mapSequence('undefined')">Search</a></li>
						<li><a href="javascript:mapPostingMode()">Posting</a></li>
					</ul></li>
				<li><a href="${pageContext.request.contextPath}/member/MemberProfileOpen.me" class="button alt">My Page</a></li>
			</ul>
		</nav>

	</div>
	
	<!-- 지도 영역 -->
	<div class="container">
		<div id="explain" style="width:90%; margin-left: 5%; margin-right: 5%; text-align: center; padding-top: 3px; padding-bottom: 3px;">
			<!-- post 페이지를 이용하기 위한 지도 클릭 이벤트 설명 -->
			<div id="locationAddress" style=" height: 2em; display: inline-block;">
				게시글을 작성하고 싶은 장소를 지도에서 선택한 다음 POST 버튼을 클릭하세요! &nbsp;&nbsp;
			</div>
			<!-- 게시글 포스팅 버튼 -->
			<a href="javascript:clickPosition()" class="button primary small" id="postBtn" style="font-size: .5em; position: absolute; display: inline-block;">post</a>
			<form action="postEditer.jsp" method="get" id="postFrm" hidden="hidden" >
				<!-- 주소 text  form을 통해 넘겨줄 데이터들을 hidden으로 작성 -->
				<input type="hidden" id="juso_1" name="juso_1"> <!-- 도로명 주소 -->
				<input type="hidden" id="juso_2" name="juso_2">	<!-- 지번 주소 -->
				<input type="hidden" id="lat" name="lat">	<!-- 위도 -->
				<input type="hidden" id="lng" name="lng">	<!-- 경도 -->
				<input type="hidden" name="member_id" value="${member_id}">
			</form>
		</div>
		
		<!-- 카카오 지도 영역 -->
		<div id="map" style="width:auto;  height: 60em; margin-bottom: 1em;"></div>
		<!-- mode:post일 때 사용 게시글 작성을 위한 선택 좌표에 마커 생성 -->
		<div id="clickLatlng"></div>
	</div>

	<!-- 게시글 보기를 통해 현재 페이지에서 dimmed 된 화면으로 팝업형태 게시물  보기 가능-->
	<div id="layerInner"></div>

	<!-- Footer -->
	<div id="footer"></div>


	<script> var member_id = "${member_id}"</script>
	<script>var contextPath = "${pageContext.request.contextPath}"</script>
	<!-- 지도 API scripts -->
	<script	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cb4dad6fbd5aa76ed4058c995c432933&libraries=services,clusterer,drawing"></script>
	
	<!-- Scripts -->
	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>

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
	<!-- 레이어 팝업 스크립트 -->
	<script src="${pageContext.request.contextPath}/assets/js/board/layerPopup.js"></script>
	<!-- 현재 위치를 불러오는 geolocation API -->
	<script src="${pageContext.request.contextPath}/assets/js/kakao/geolocation.js"></script>
	<!-- 지도 API관련 작성 메소드 -->
	<script src="${pageContext.request.contextPath}/assets/js/kakao/kakaoMap.js"></script>
	<!-- 지도 위치 로딩 스크립트 순서 지정 -->
	<script src="${pageContext.request.contextPath}/assets/js/kakao/mapSequence.js"></script>

	<script>
	/* 에디터에서 지도로 넘어올때 파라미터 값 체크 name = true 일 경우 mode:post로 로딩시킴 */
	<% 
	 	request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name"); 
	%>
		mapSequence(<%=name%>);
		$(document).ready(function() {
			console.log("${member_id}");
			$("#layerInner").load("${pageContext.request.contextPath}/app/board/search/inner_search.jsp");
			$("#footer").load("${pageContext.request.contextPath}/app/board/footer.html");
		})
		
	</script>

</body>
</html>