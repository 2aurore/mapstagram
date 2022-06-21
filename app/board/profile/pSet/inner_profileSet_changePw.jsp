<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="prf" >
	<form style="text-align:center" action="${pageContext.request.contextPath}/member/MemberChangePwOk.me" name="changePwForm">
		<table>
		
			<tr>
				<td colspan="2">
					<div class="inner" style="width: 100%">
					<div id="profileInfo" style="width: 100%; text-align:center;">
						<div class="box" style="background: #BDBDBD; margin-left: 20%">
							<img class="profile" src="${pageContext.request.contextPath}${mInfo.getMember_picture()}" alt=""/>
						</div>
						<div class="text" style="width: 65%; margin-left:auto">
							<section>
								<h2 style="margin-top:1em">${member_id}</h2>
							</section>
						</div>
					</div>
					
				</div>
				</td>
			</tr>
			<tr>
				<td>이전 비밀번호</td>
				<td><input type="password" name="oriPw" style="border: 1"></td>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td><input type="password" name="newPw" style="border: 1"></td>
			</tr>
			<tr>
				<td>새 비밀번호 확인</td>
				<td><input type="password" name="newPw2" style="border: 1"></td>
			</tr>
			
		</table>
			<input type="submit" value="비밀번호 변경" onclick="return changePw();"/>
	</form>							
	
	<div style="text-align:center">
		<a href="${pageContext.request.contextPath}/app/member/email.jsp">비밀번호를 잊으셨나요?</a>
	</div>
	
</div>
<script>
	function changePw(){
		var frm = document.changePwForm;
		
		if(frm.oriPw.value != ${mInfo.getMember_pw()}){
			alert("이전 비밀번호가 일치하지 않습니다.");
			frm.oriPw.focus();
			return false;
		}
		
		if(frm.newPw.value != frm.newPw2.value){
			alert("새 비밀번호가 일치하지 않습니다.");
			frm.newPw.focus();
			return false;
		}
		
		frm.submit();
		
	}
</script>