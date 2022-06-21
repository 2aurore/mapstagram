/**
 * 에디터 경고창 자바 스크립트
 */
function postBoard() {
	var title = $('#board_title').val();
	
	if(title == ""){
		alert("제목을 입력해주세요!");
		return;
	}
	
	$("#member_id").val();
	var board_contents = $(".note-editable").html();
	$('input[name="board_contents"]').val(board_contents);
	
	document.postFrm.submit();
}


function contentReset() {
	var msg = "작성한 내용을 초기화 하시겠습니까?";
	if (confirm(msg)!=0) {
		// Yes click
		window.location.reload();
	} else {
		// no click
	}
}

function myConfirm() {
	var msg = "처음 화면으로 돌아가시겠습니까?\n현재 작성한 내용은 저장되지 않습니다.";
	if (confirm(msg)!=0) {
		// Yes click
		location.href = 'boardMapPage.jsp';
	} else {
		// no click
	}
} //confirm

function moveMypage() {
	var msg = "글 작성을 취소하고, 마이페이지로 이동하시겠습니까?\n현재 작성한 내용은 저장되지 않습니다.";
	if (confirm(msg)!=0) {
		// Yes click
		/* 마이페이지 링크 삽입 */
		//console.log("editerAlret.js:마이페이지 링크 삽입");
		location.href = 'profile.jsp';
	} else {
		// no click
	}
}


function reSelect() {
	var msg = "지도에서 장소를 다시 선택하시겠습니까?\n현재 작성한 내용은 저장되지 않습니다.";
	if (confirm(msg)!=0) {
		// Yes click
		if($('input[name=selected]')){
			location.href="boardMapPage.jsp?name=true";
		}
	} else {
		// no click
	}
}

