<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<section id="main" class="wrapper style1 special" style="padding-top:0">
	<div class="container" style="width:inherit;">
		<div class="inner" id="inner_myInfo">
			<c:set var="birthString" value="${mInfo.getBirth()}"></c:set>
			<c:set var="birthFull" value="${fn:split(birthString,' ')[0]}" />

		<%-- 	<div style="width:35em; margin:0 auto;">
					<input type="text" style="border:none; background-color:white;" value="이름 : ${mInfo.getMember_name()}" disabled>
					<input type="text" value="아이디 : ${mInfo.getMember_id()}">
					<input type="text" value="이메일 : ${mInfo.getMember_email()}">
					<input type="text" value="전화번호 : ${mInfo.getMember_tel()}">
					<input type="text" value="생일 : ${fn:split(birthFull,'-')[0]}년 ${fn:split(birthFull,'-')[1]}월 ${fn:split(birthFull,'-')[2]}일">
					<input type="text" value="주소 : ${mInfo.getAddr()}">
			</div> --%>


			<!-- 표시하지 않을 tr은 style에 display:none;을 줬음 -->
			<table style="width:35em; margin:0 auto; border:hidden">	
				<tr id="info_name" style="background-color:white">
					<td style="font-weight:bold">이름</td>
					<td>${mInfo.getMember_name()}</td>
				</tr>
				<tr id="info_id" style="background-color:white; display:none">
					<td style="font-weight:bold">아이디</td>
					<td>${mInfo.getMember_id()}</td>
				</tr>
				<tr id="info_email" style="display:none; background-color:white">
					<td style="font-weight:bold">이메일</td>
					<td>${mInfo.getMember_email()}</td>
				</tr>
				<tr id="info_tel" style="background-color:white">
					<td style="font-weight:bold">전화번호</td>
					<td>${mInfo.getMember_tel()}</td>
				</tr>
				<tr id="info_birth" style="background-color:white">
					<td style="vertical-align:middle; font-weight:bold">생일</td>
					<td>${fn:split(birthFull,'-')[0]}년 ${fn:split(birthFull,'-')[1]}월 ${fn:split(birthFull,'-')[2]}일</td>
				</tr>
				<tr id="info_addr" style="background-color:white">
					<td style="font-weight:bold">주소</td>
					<td>${mInfo.getAddr()}</td>
				</tr>
			</table> 
		 
		</div>
	</div>
</section>
