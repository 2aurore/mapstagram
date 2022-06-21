<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<style>
	
	#profileMain .box{
		width: 9em;
		height: 9em;
		border-radius: 70%;
		overflow: hidden;
		float: left;
		padding: 0;
	}
	#profileMain .profile{
		width: 100%;
		height: 100%;
		object-fit: cover; 
	}
	#profileMain ul.icons li {
		margin-left: 4em;
		margin-right: 4em,;
	}
	#profileMain p {
		margin: 0 0 1em 0;
	}
	#profileMain #btn1 {
		padding: 0 0.7em;
		height: 2.5em;
		line-height: 2.5em;
		letter-spacing: 0.25em;
		font-family: 'Noto Sans KR', sans-serif;
	}
	</style>
	
	<!-- Main -->
		<section id="main" class="wrapper style1 special">
			<div class="container" style="width:50%;" id="profileMain">
	
				<div style="width: 100%">
					<div id="profileInfo" style="width: 100%; text-align:center;">
						<div class="box" style="background: #BDBDBD; margin-left: 20%">
							<img class="profile" src="../../../images/11.jpg" alt=""/>
						</div>
						<div class="text" style="width: 65%; margin-left:auto">
							<section>
								<p style="font-size:150%">friend1 &nbsp &nbsp <a onclick="openSetProfile()" id="btn1" class="button small" style="font-size:50%">친구 추가</a></p>
								<p>친구 <b>1234</b>&nbsp &nbsp 게시물 <b>34</b></p>
								<p>김친구 &nbsp &nbsp</p>
							</section>
						</div>
					</div>
					
				</div>
				<hr>
				<ul class="icons" >
					<li><a href="#" onclick="changeMenu(1)"><span class="label">메뉴1</span></a></li>
					<li><a href="#" onclick="changeMenu(2)"><span class="label">메뉴2</span></a></li>
					<li><a href="#" onclick="changeMenu(3)"><span class="label">메뉴3</span></a></li>
					<li><a href="#" onclick="changeMenu(4)"><span class="label">메뉴4</span></a></li>
				</ul>
				<br>
				
				<div id="menu">
			
				</div>
				
			</div>
		</section>
		
		<script>
				$(document).ready(function() {
					$("#menu").load("friend/fMenu/inner_f_menu1.jsp")
				});
		</script>		
		
		