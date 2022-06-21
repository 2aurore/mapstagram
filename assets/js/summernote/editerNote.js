/**
 * summernote 관련 스크립트 
 */

$(document).ready(function() {
	$('#summernote').summernote({
		placeholder: '자유롭게 글을 작성할 수 있습니다.<br/>명예훼손이나 상대방을 비방, 불쾌감을 주는 글, 욕설, 남을 모욕하는 글은 임의로 제제가 있을 수 있습니다.',
		tabsize: 2,
		height: 500,
		lang:'ko-KR',
		dialogsInBody: true,
		focus: true,                  // set focus to editable area after initializing summernote
		 toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough']],
			    ['color', ['forecolor','color']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['insert',['picture','video']],
			    ['view', [ 'help']]
			  ],
			  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			  popover: {
				  image: [
					  ['imageResize', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
					  ['float', ['floatLeft', 'floatRight', 'floatNone']],
					  ['remove', ['removeMedia']],
					  ['custom', ['imageTitle']],
					  ]
			  },
			  callbacks: {
				  onImageUpload: function(files, editor, welEditable) {
					  for (var i = files.length - 1; i >= 0; i--) {
						  sendFile(files[i], this);
						  //console.log("callback");	//ok
					  }
				  }
			  }

	});

});


/* 이미지 업로드 경로 설정 변경 메소드 - 백단 구현 시 수정 */
function sendFile(file, el) {
	
	$("#imgLoad").show();
	//console.log("sendFile");	//ok
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type: "POST",
		url:  contextpath + '/board/SummernoteImgUploadOk.bo',
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(url) {
			//console.log('들어옴');
			//console.log(url);
			//console.log("img : "+img_name);
			
			setTimeout(() => {
				var image = $('<img>').attr('src', url).css('width','200px');
				$(el).summernote('insertNode', image[0]);
				$("#imgLoad").hide();
			}, 5500);
		},
		 error: function (data) {
	            alert("에러 : " + data.responseText);
        }
	});
}


//  $(selector).summernote("pasteHTML", '<p><img src="' + image_url + '" /></p>');




/* 에디터 액션 선택 시 block 처리 되지 않게 function 추가  */
$(document).on("show.bs.modal", '.modal', function (event) {
    console.log("Global show.bs.modal fire");
    var zIndex = 100000 + (10 * $(".modal:visible").length);
    $(this).css("z-index", zIndex);
    setTimeout(function () {
        $(".modal-backdrop").not(".modal-stack").first().css("z-index", zIndex - 1).addClass("modal-stack");
    }, 0);
}).on("hidden.bs.modal", '.modal', function (event) {
    console.log("Global hidden.bs.modal fire");
    $(".modal:visible").length && $("body").addClass("modal-open");
});
$(document).on('inserted.bs.tooltip', function (event) {
    console.log("Global show.bs.tooltip fire");
    var zIndex = 100000 + (10 * $(".modal:visible").length);
    var tooltipId = $(event.target).attr("aria-describedby");
    $("#" + tooltipId).css("z-index", zIndex);
});
$(document).on('inserted.bs.popover', function (event) {
    console.log("Global inserted.bs.popover fire");
    var zIndex = 100000 + (10 * $(".modal:visible").length);
    var popoverId = $(event.target).attr("aria-describedby");
    $("#" + popoverId).css("z-index", zIndex);
});