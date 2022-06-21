<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/important/popupLayer.css" >
<style>
	.imgbox{
		width: 15em;
		height: 15em;
		overflow: hidden;
		margin: auto;
		margin-bottom: 0.5em;
	}
	
	.fImg{
		width: 100%;
		height: 100%;
		object-fit: cover; 
	}
</style>
<c:set var="boardList" value="${searchBoardList}"/>  
<c:set var="src" value="${src}"/>
<div id="searchMenu">

	<div class="icon-grid" style="margin-top: 4em;">
		<div class="row gtr-uniform gtr-150">
			<c:forEach var="board" items="${boardList}" varStatus="status">
				<section class="col-4 col-6-large col-12-small">
					<div class="imgbox" style="background: #FFF;" onclick="test(${board.getPosition_serial()})">
						<c:choose>
							<c:when test="${searchSrcList[status.index] == null}">
								<h2>${board.getBoard_title()}</h2>
							</c:when>
							<c:otherwise>
								<img class="fImg" src="${searchSrcList[status.index]}" alt=""/>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
			</c:forEach>
		
		</div>
	</div>
</div>


<!-- 팝업 게시물 -->
	<div id="layerInner" style="text-align: initial;"></div>
<script>var contextpath = "${pageContext.request.contextPath}"</script>
<script src="${pageContext.request.contextPath}/assets/js/board/layerPopup.js"></script>
<script>
	$(document).ready(function() {
		$("#layerInner").load("${pageContext.request.contextPath}/app/board/search/inner_search.jsp");
	})
</script>

