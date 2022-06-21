/**
 * 게시글의 댓글 달기 
 */
var jObj;

function eventEnter() {
	//console.log("댓글 엔터 누름");
	
	var reply_id = member_id;
	var board_num = $('#board_num').val();
	var reply_content = $('#replyArea').val();
	
	var html = '<div class="reply_area">'+
			'<span class="reply_id">'+ reply_id +'</span>'+
			'<span class="reply_contents">'+ reply_content +'</span>'+
			'<span class="reply_date">new</span>'+
			'</div>';
	
	$.ajax({
		url: contextpath + "/board/BoardReplyOk.bo",
		method: "post",
		data: {
			"reply_id": reply_id,
			"board_num": board_num,
			"reply_content": reply_content
		},
		success: function(data){
			//console.log("댓글전송 성공");
			$('#replyArea').val("");
			$('div.middle').prepend(html);
		},
		error: function(){
			alert("댓글 등록에 실패했습니다. 잠시 후 다시 이용해주세요.");
		}
		
		
	});
	
}

//게시글 댓글 불러오기
function getReply(board_num) {
	//console.log("댓글 불러오기 메소드 "+board_num);
	
	$.ajax({
		url: contextpath +"/board/ShowAllReply.bo?board_num="+board_num,
		type: 'get',
		dataType: 'text',
		success: function(data) {
			data = decodeURIComponent(data);
			for(let i=0; i<data.length; i++){
				data = data.replace("+", " ");
			}
			//console.log(data);
			jObj = JSON.parse(data);
			putReply(jObj);
		},
		error: function(){
			console.log("댓글가져오기 실패");
		}
	});
}

function putReply(jObj) {
	
	
	var replys = [];
	for (var i = 0; i < jObj.length; i++) {
		replys.push(jObj[i]);
	}
	console.log(replys);
	
	for (var i = 0; i < replys.length; i++) {
		var date = replys[i]['reply_date'];
		date = date.substring(0, date.lastIndexOf(':'));
		
		var html = '<div class="reply_area">'+
			'<span class="reply_id">'+ replys[i]['reply_id'] +'</span>'+
			'<span class="reply_contents">'+ replys[i]['reply_contents'] +'</span>'+
			'<span class="reply_date">'+ date +'</span>'+
			'</div>';
		$('div.middle').append(html);
	}
}


