<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style>
	.imgbox{
		width: 6em;
		height: 6em;
		border-radius: 70%;
		overflow: hidden;
		margin: auto;
		margin-bottom: 0.5em;
	}
	
	.fImg{
		width: 100%;
		height: 100%;
		object-fit: cover; 
	}
	
	.fsec{
		font-size: 120%;
	}
</style>
<div id="menu">
	<div id="friendHeader" style="display:flex">
		<div style="width:50%; text-align:left; float:left;">
			<h3>친구</h3>
		</div>
		<div style="width:50%; text-align:right;">
			<div style="display:flex">
				<input type="text" id="f_search" placeholder="search" style="widht:20em;"/>
				<div style="width:8em; margin-left:5px; margin-right:5px;">
					<a href="${pageContext.request.contextPath}/member/MemberFindfriendOpen.me?member_id=${member_id}"><b>친구 찾기</b></a>
				</div>
				<div style="width:8em; margin-left:5px; margin-right:5px;">
					<a href="javascript:getMyfriendRequest('#layerFriendsInner'); javascript:friendRequestOpen('${sendCnt}', '${receiveCnt}')"><b>친구 요청</b></a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="icon-grid" style="margin-top: 4em;">
		<div class="row gtr-uniform gtr-150">
			<c:if test="${fn:length(friendList) == 0}">
				<p>친구가 없습니다.</p>
			</c:if>
			<c:forEach var="friend" items="${friendList}">
				<section class="col-3 col-6-large col-12-small fsec">
					<div class="imgbox">
						<img class="fImg" src="${pageContext.request.contextPath}/${friend.getMember_picture()}" alt=""/>
					</div>
					<a href="${pageContext.request.contextPath}/member/MemberProfileOpen.me?friend_id=${friend.getMember_id()}">${friend.getMember_name()}</a>
				</section>
			</c:forEach>
		</div>
	</div>
	

</div>

<!-- 팝업 게시물 -->
<div id="layerFriendsInner" style="text-align: initial;"></div>
	
<script>var contextpath = "${pageContext.request.contextPath}"</script>
<script src="${pageContext.request.contextPath}/assets/js/board/layerPopup.js"></script>
<script>
	$(document).ready(function() {
		$("#layerFriendsInner").load("${pageContext.request.contextPath}/app/board/search/inner_requestFromFriends.jsp");
	})
</script>


