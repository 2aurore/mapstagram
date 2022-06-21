<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<c:set var="boardBean" value="${requestScope.boardBean}"/>
<c:set var="replyBeanList" value="${requestScope.replyBeanList}"/>

<div class="dim-layer">
    <div class="dimBg">
		<a href="#" class="btn-layerClose">
			<img src="${pageContext.request.contextPath}/images/btn-close.PNG" alt=""/>
		</a>
    </div>
    <div id="layer" class="pop-layer">
    	<input type="hidden" id="board_num" value="">
    	<input type="hidden" id="position_serial">
    	<div class="pop-left">
	    	<div id="board_header">
	    		<h3 id="board_title"></h3><span id="board_date"></span>
			</div>
			<div id="board_contents"></div>   	
    	</div>
    
    	<div class="pop-right">
    		<div class="top">
 			  	<div class="writter-imgbox">
					<img class="writter-img" src="${pageContext.request.contextPath}/images/22.jpg" alt=""/>
				</div>
    			<div style="margin-top: 0.5em;">
    				<div>
    					<a href="#" id="board_id"></a>
    				</div>
    				<div class="board_position">
    				<a href="#" id="board_position">
	    				<span id="boardJuso_1"></span>
	    				<span id="boardJuso_2"></span>
    				</a>
    				</div>
    				
    			</div>
    		</div>
    		<div class="like" style="visibility: hidden;">
    			조회수 <span id="board_cnt"></span>
    			<a href="javascript:clickLike()" id="board_like"><i class="far fa-heart"></i></a>
    		</div>
    		<div class="bottom">
    			<input type="text" id="replyArea" placeholder="댓글 달기..." onkeypress="javascript:if(event.keyCode==13){eventEnter()}"/>
    		</div>
    		<div class="middle">
    			<%-- <c:set var="replyList" value="${replyList}"/>
    			
    			<c:forEach var="reply" items="${replyList}" varStatus="status">
	    			<div class="reply_area">
		    			<span class="reply_id">uououo12</span>
		    			<span class="reply_contents">댓글 영역 만들기</span>
		    			<span class="reply_date">2020.11.13</span>
	    			</div>
    			</c:forEach> --%>
    		</div>
    	</div>
      
    </div>
</div>
