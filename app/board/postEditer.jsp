<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/summernote/summernote-lite.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/reaction.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/dimArea.css" />
<title>Treat Trip</title>
</head>
<style>
.container { padding: 0 4em 0 4em; margin-bottom: 4em;}
</style>
<body class="is-preload">
	<!-- Header -->
	<!-- 게시글 작성 중 페이지 이동을 고려하여 버튼 클릭 이벤트로 javascript 부여 -->
	<div id="header">
		<h1 id="logo">
			<a href="javascript:myConfirm()">Treat Trip</a>
		</h1>
		<nav id="nav">
			<ul>
				<li><a href="javascript:myConfirm()">Home</a></li>
				<li><a href="javascript:moveMypage()" class="button alt">My&nbsp;Page</a></li>
			</ul>
		</nav>
	</div>
	
	<!-- 이미지 업로드시 4초 동안 로딩 화면 노출 -->
	<div class="dim-layer" id="imgLoad">
		<div class="dimBg"></div>
		<div id="loadPopUp"></div>
	</div>

		<div class="container">
			<form name="postFrm" method="post" action="${pageContext.request.contextPath}/board/PositionAddOk.bo" >
				<div class="row">
					<div class="col-6" id="editerLogo" >
						<img alt="" src="${pageContext.request.contextPath}/images/logos/logo_header_shortH.png" width="360px">
					</div>
					<div class="col-6" id="addrFrm">
						<!-- 게시글을 작성할 주소 위치 정보 -->
						<div  id="reSeledtFrm" >
							도로명 주소 : <code>${param.juso_1}</code><br>
							<input type="hidden" name="juso_1" value="${param.juso_1}">
							지번 주소 : <code>${param.juso_2}</code><br>
							<input type="hidden" name="juso_2" value="${param.juso_2}">
							<!-- 선택한 주소의 위도 -->
							<input type="hidden" name="lat" value="${param.lat}">
							<!-- 선택한 주소의 경도 -->
							<input type="hidden" name="lng" value="${param.lng}"> 
							
							<!-- selected의 값에 따라 위치 다시 선택 버튼 클릭 시 post 모드가 필요한지 검증 사용 -->
							<input type="hidden" name="selected" value="true"> 
							<input type="hidden" id="member_id" name="member_id">
							
							<a href="javascript:reSelect();" class="button alt small" id="reSelect" >위치 다시 선택</a>
						</div>
					</div>
				</div>
			
				<!-- 게시글 제목 -->
				<input id="board_title" name="board_title" placeholder="title" >

				<!-- 게시글 내용 -->
				<textarea id="summernote" name="editordata board_contents"></textarea>
				<input type="hidden" name="board_contents">
				
				<!-- 게시글 공개 범위 -->
				<!-- 공개 범위 현재 default값인 전체 공개로 작성됨, 추후 공개여부에 따라 게시글 조회가 가능하도록 업데이트 예정  -->
				<div class="half-Area row" style="visibility: hidden;">
					<input type="radio" name="priority" id="priority-all" value="전체공개" checked>
						<label for="priority-all">전체&nbsp;공개</label> 
					<input type="radio" name="priority" id="priority-friend" value="친구공개">
						<label for="priority-friend">친구&nbsp;공개</label> 
					<input type="radio" name="priority" id="priority-own" value="나만보기">
						<label for="priority-own">나만&nbsp;보기</label>
				</div>
				<div class="half-Area" style="float: right; text-align: end;">
					<a href="javascript:contentReset();" class="button" >RESET</a>
					<a href="javascript:postBoard();" class="button primary" style="margin-left: 2em;">POST</a>
				</div>
			</form>
		</div>
		
	<!-- Footer -->
	<div id="footer" >	</div>

	<script src="//code.jquery.com/jquery-3.4.1.min.js"></script>

	<!--기본 Scripts -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>


	<!-- summernote 사용하기 위한 라이브러리 추가 -->
	<script>var contextpath = "${pageContext.request.contextPath}"</script>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/summernote/editerAlret.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/summernote/editerNote.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/summernote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/summernote/lang/summernote-ko-KR.min.js"></script>

	
	<script>
		$(document).ready(function() {
			//세션에 저장된 로그인된 회원의 아이디를 db 저장시 form과 함께 넘겨주기 위해 hidden으로 저장
			$("#member_id").val("${member_id}");
			
			$("#imgLoad").hide();
			$("#footer").load(contextpath+"/app/board/footer.html");
		});
		
		

	</script>

</body>
</html>