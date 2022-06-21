<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<div id="prf">
	<form style="text-align:center" action="${pageContext.request.contextPath}/member/MemberUpdateInfoOk.me" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td colspan="2">
					<div class="inner" style="width: 100%">
					<div id="profileInfo" style="width: 100%; text-align:center;">
						<div id="image_container" class="box" style="background: #BDBDBD; margin-left: 20%">
							<img id="img_container" class="profile" src="${pageContext.request.contextPath}${mInfo.getMember_picture()}" alt=""/> 
						</div>
						<div class="text" style="width: 65%; margin-left:auto">
							<section>
								<h2 style="margin-top:1em">${member_id}</h2>
								
								<!-- <a href="#">사진 변경</a> -->
							<div class="filebox">
							  	<label for="ex_file">사진 선택</label>
							  	<input type="file" id="ex_file" accept="image/*" onchange="setThumbnail(event);" name="profilePicture">
									
							</div>
							
							</section>
						</div>
					</div>
					
				</div>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" style="border: 1" name="member_name" value="${mInfo.getMember_name()}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" style="border: 1" name="member_id" value="${mInfo.getMember_id()}" readonly></td>
				
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" style="border: 1" name="member_email" value="${mInfo.getMember_email()}"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" style="border: 1" name="member_tel" value="${mInfo.getMember_tel()}"></td>
			</tr>
		</table>
			<input type="submit" value="변경하기" />
	</form>							
</div>
