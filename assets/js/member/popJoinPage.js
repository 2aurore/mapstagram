/**
 *	로그인 페이지에서 회원가입 페이지 팝업 띄우기
 */

function openJoin(){
	var popupX = (document.body.offsetWidth / 2) - (600 / 2);
	var popupY= (window.screen.height / 2) - (700 / 2);
	
	window.open('app/member/joinForm.jsp', '', 'status=no, height=600, width=700, left='+ popupX + ', top='+ popupY);

}

var idFlag = false;
var mailFlag = false;

//아이디 중복 확인 에이작스
function checkId(id){
	idFlag = false;
	if(id == ""){
		$("#idCheck_text").text("아이디를 입력해주세요.");
	}else if(id.length < 4 || id.length > 16){
		$("#idCheck_text").text("아이디는 4자 이상, 16자 이하로 입력해주세요.");
	}
	else{
		console.log(id);
		$.ajax({
			url: contextPath + "/member/MemberCheckIdOk.me?member_id="+id,
			type: 'get',
			dataType: 'text',
			success: function(data){
				if(data.trim() == "ok"){
					$("#idCheck_text").text("사용할 수 있는 아이디입니다.");
					idFlag = true;
				}else{
					$("#idCheck_text").text("중복된 아이디입니다.");
					return false;
				}
			},
			error: function(){
				console.log("오류");
				console.log(contextPath);
			}
		})
	}
}

//비밀번호 확인 에이작스
function checkPw(pw2){
	var pw1 = $("input[name='member_pw']").val();
	
	if(pw1 != "" || pw2 != ""){
		if(pw1 == pw2){
			$("#pwCheck_text").text("비밀번호가 일치합니다.");
			return true;
		}else{
			$("#pwCheck_text").text("비밀번호가 일치하지 않습니다.");
			return false;;
		}
	}
}
$("input[name='pw_check']").keyup(function(event){
	var pw = $("input[name='pw_check']").val();
	checkPw(pw);
});

//이메일 확인 에이작스
function checkEmail(email){
	mailFlag = false;
	if(email == ""){
		$("#emailCheck_text").text("이메일을 입력해주세요.");
	}else{
		$.ajax({
			url: contextPath + "/member/MemberCheckEmailOk.me?member_email="+email,
			type: 'get',
			dataType: 'text',
			success: function(data){
				if(data.trim() == "success"){
					$("#emailCheck_text").text("사용할 수 있는 이메일 입니다.");
					mailFlag = true;
				}else{
					$("#emailCheck_text").text("사용할 수 없는 이메일 입니다.");
				}
			},
			error: function(){
				console.log("오류");
			}
		})
	}
}

//회원가입 
function sendJoin(){
	var frm = document.joinForm;
	
	if(frm.member_id.value == ""){
		alert("아이디를 입력해주세요.");
		frm.member_id.focus();
		return false;
	}
	if(frm.member_name.value == ""){
		alert("이름을 입력해주세요.");
		frm.member_name.focus();
		return false;
	}
	if(frm.member_email.value == ""){
		alert("이메일을 입력해주세요.");
		frm.member_email.focus();
		return false;
	}
	
	if(frm.member_pw.value == ""){
		alert("패스워드를 입력해주세요.");
		frm.pw.focus();
		return false;
	} 
	else{
		//8자리 이상, 대문자/소문자/숫자/특수문자 모두 포함되어 있는지 검사
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		
		if(!reg.test(frm.member_pw.value)){
			alert("비밀번호는 8자 이상이어야 하며, 대문자/소문자/숫자/특수문자 모두 포함해야 합니다.");
			frm.member_pw.focus();
			return false;
		} 
		//같은 문자를 4번 이상 사용할 수 없다.
		else if(/(\w)\1\1\1/.test(frm.member_pw.value)){
			alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
			frm.member_pw.focus();
			return false;
		}
		//비밀번호에 아이디가 포함되어 있을 수 없다.
		else if(frm.member_pw.value.search(frm.member_id.value) > -1){
			alert("비밀번호에 아이디를 포함할 수 없습니다.");
			frm.member_pw.focus();
			return false;
		}
		//비밀번호에 공백을 포함할 수 없다.
		else if(frm.member_pw.value.search(/\s/) != -1){
			alert("비밀번호는 공백 없이 입력해주세요.");
			frm.member_pw.focus();
			return false;
		}
		//비밀번호에 한글을 포함할 수 없다.
		else if(hangleCheck.test(frm.member_pw.value)){
			alert("비밀번호에 한글을 사용할 수 없습니다.");
			frm.member_pw.focus();
			return false;
		}
	}

	if(frm.member_pw.value != frm.pw_check.value){
		alert("비밀번호를 확인해주세요.");
		frm.pw_check.focus();
		return false;
	}
	
/*	if(!checkId(frm.member_id.value) || !checkEmail(frm.member_email.value)){
		alert("중복 확인");
		return false;
	}
	*/
	if(!idFlag || !mailFlag){
		alert("중복 확인해주세요.");
		return false;
	}
	
	frm.submit();
}

//약관 동의 필수 체크
$(function(){
	$("#agree-check").change(function(){
		if($("#agree-check").prop("checked")){
			$("#joinFrmSend").attr("disabled", false);
		}else{
			$("#joinFrmSend").attr("disabled", true);
		}
	});
});
