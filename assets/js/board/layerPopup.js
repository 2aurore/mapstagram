/**
 * 지도에서 팝업으로 게시글 띄우기
 */
var jObj;

function getMyboard(serial){
	$.ajax({
		url: contextpath+ "/board/BoardView.bo?serial="+serial,
		type: 'get',
		dataType: 'text',
		success : function(data) {
			//console.log("게시글 가져오기 성공");
			data = decodeURIComponent(data);
			for(let i=0; i<data.length; i++){
				data = data.replace("+", " ");
			}
			jObj = JSON.parse(data);
			putBoardData(jObj);
			getReply($('#board_num').val());
			//console.log(jObj);
		},
		error: function(){
			alert("페이지를 불러올 수 없습니다. 잠시 후 다시 이용해주세요.");
			//console.log("게시글 가져오기 에러");
		}
	});
	
	layer_popup("#layer");
}

function getMyfriendRequest(member_id){
	layer_popup("#friendsLayer");
}

function putBoardData(data) {
	$('div.middle *').remove();
	
	$('#board_num').val(data['board_num']);
	$('#position_serial').val(data['position_serial']);
	$('#board_title').html(data['board_title']);
	$('#board_date').html(data['board_date']);
	$('#board_contents').html(data['board_contents']);
	$('#board_id').html(data['member_id']);
	$('#board_cnt').html(data['board_cnt']);
	
	if(data['juso_1'] != null){
		$('#boardJuso_1').html(data['juso_1']+"<br>");
	}
	$('#boardJuso_2').html(data['juso_2']);
	
	//console.log(data['board_date']);
}



//board_like 클릭 이벤트
function clickLike() {
	//카운트 업데이트 하기
	var likeTag = $('#board_like'); 
	var fullHeart = '<i class="fas fa-heart"></i>';
	var emptyHeart = '<i class="far fa-heart"></i>';
	//console.log(likeTag);
	likeTag.html() == emptyHeart ? likeTag.html(fullHeart) : likeTag.html(emptyHeart) ;
}



/**
 * search에서 게시글 팝업 
 */	
$('.btn-layer').click(function(){
	var $href = $(this).attr('href');
	layer_popup($href);
});
function layer_popup(el){
	var $el = $(el);//레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg');//dimmed 레이어를 감지하기 위한 boolean 변수

	$('body').css('overflow-y', 'hidden');//body의 스크롤을 없앤다
	isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	var $elWidth = ~~($el.outerWidth()),
	$elHeight = ~~($el.outerHeight()),
	docWidth = $(document).width(),
	docHeight = $(document).height();

	// 화면의 중앙에 레이어를 띄운다.
	if ($elHeight < docHeight || $elWidth < docWidth) {
		$el.css({
			marginTop: -$elHeight /2,
			marginLeft: -$elWidth/2
		})
	} else {
		$el.css({top: 0, left: 0});
	}

	$el.prev().find('a.btn-layerClose').click(function(){
		isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
		$('body').css('overflow-y', 'scroll');//body의 스크롤 재생성
		return false;
	});

	$('.layer .dimBg').click(function(){
		$('.dim-layer').fadeOut();
		return false;
	});

}