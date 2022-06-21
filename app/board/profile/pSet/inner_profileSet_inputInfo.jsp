<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="prf" >
	<form style="text-align:center " action="${pageContext.request.contextPath}/member/MemberAddInfoOk.me" name="addInfoForm" method="post">
		<table>
			<tr>
				<td>전화번호</td>
				<td><input type="text" style="border: 1" name="member_tel" value="${mInfo.getMember_tel()}"></td>
			</tr>
			<tr>
				<td style="vertical-align:middle">생일</td>
				<td>
                        <div id="bir_year">
                        	<input type="text" name="year" class="int" maxlength="4" placeholder="년(4자)" style="width:30%; float:left">
                        </div>
                        <div id="bir_month">
                            <select name="month" style="width:30%; margin-left:0.5em; float:left">
                                <option>월</option>
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>                                    
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                        <div id="bir_day">
                            <input type="text" name="day" class="int" maxlength="2" placeholder="일" style="width:30%; float:left;  margin-left:0.5em; ">
                        </div>

				</td>
			</tr>
			<tr><td colspan="2">주소</td></tr>
			<tr>
				<td style="vertical-align:middle">우편번호</td>
				<td><input type="text" name="member_postCode" class="postcodify_postcode5" value="${mInfo.getMember_postCode()}" readonly style="border: 1; width:13em; float:left">
				<input type="button" id="postcodify_search_button" class="button alt small" style="float:right" value="검색"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" style="border: 1" class="postcodify_address" value="${mInfo.getAddr()}" readonly></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="addr_detail" style="border: 1" class="postcodify_details" value="${mInfo.getAddr_detail()}"></td>
			</tr>
			
		</table>
			<input type="submit" value="추가정보 저장" onclick="return addInfo();"/>
	</form>							
	
</div>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
	<script>
		function addInfo(){
			var frm = document.addInfoForm;
			
			/* 태어난 년도 네자리로 입력 안했을 때 */
			if(frm.year.value != "" && frm.year.value.length != 4){
				alert("태어난 년도를 네자리 숫자로 입력해주세요.");
				frm.year.focus();
				return false;
			}
			/* 생일 day를 1보다 작게, 31보다 크게 입력했을 때 */
			if(frm.day.value != ""){
				if(Number(frm.day.value) < 1  || Number(frm.day.value) > 31){
					alert("정확한 생일을 입력해주세요.");
					frm.day.focus();
					return false;
				}
			}
		}
	</script>