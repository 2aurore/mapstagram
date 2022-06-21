<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
	/* ----------------------------- */
	.imgbox{
		width: 4em;
		height: 4em;
		border-radius: 70%;
		overflow: hidden;
		float: left;
		margin: auto 0 auto 0;
	}
	
	.fImg{
		width: 100%;
		height: 100%;
		object-fit: cover; 
	}
	.friendBox{
		display: flex;
	}

	.friendBox .addfriendbox{
		margin: auto 0 auto auto;
		display: flex;
		width: 8em;
	}
	
	#friendcontent hr{
		margin: 1em 0;
	}
	#inner_friendbar a, input{
		color: white;
	}

	/* ----------------------------- */
	
	#friendsLayer #request{
		width: 100%;
		text-align: center;
	}
	#friendsLayer #board_header{
		margin-bottom: 1em;
		margin-top: 1em;
	}
	#request hr{
		margin: 1em 0;
	}
	#f {
		width: 70%;
		margin: auto;
	}
	#request {
		overflow: scroll;
		overflow-x: hidden;
		-ms-overflow-style: none;
		word-break: break-all;
	}
	#request::-webkit-scrollbar {
		display: none;
	}
	#none{
		color: #BDBDBD;
		font-weight: 500;
	}
	#f .infobox{
		color: #888;
		text-align: left;
		margin: auto 0 auto 0.8em;
		width: 12em;
	}
	.addfriendbox #FriendBtn{
		font-size: 0.8em;
		height: 2.5em;
		margin: auto;
		line-height: 2.5em;
		padding: 0 1em;
	}
	
	.addfriendbox .ok{
		
	}

	.addfriendbox .no{
		background: #888;
	}
	
</style>

<div class="dim-layer">
    <div class="dimBg">
		<a href="#" class="btn-layerClose">
			<img src="${pageContext.request.contextPath}/images/btn-close.PNG" alt=""/>
		</a>
    </div>
    <div id="friendsLayer" class="pop-layer" style="width:30%;">
    	<div id="request">
    		<div id="sendRequest-contents">
		    	<div id="board_header">
		    		<h3>보낸 요청</h3>
				</div>
				<hr>
				<div id="sendRequest" class="board_contents">
				
				
				
				</div> 
			</div>
			
			<div id="receiveRequest-contents">
		    	<div id="board_header">
		    		<h3>받은 요청</h3>
				</div>
				<hr>
				<div id="receiveRequest" class="board_contents">



				</div>   	
			</div>
    	</div>
    
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/member/profilePage.js"></script>
