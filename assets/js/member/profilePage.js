/**
 * 나의 프로필 페이지 (profile.jsp)
 * 친구의 프로필 페이지 (freind_profile.jsp)
 * 관련 스크립트
 */
var jobj;

/*function changeProfilePicture(){
	
	var $prf = document.getElementById('prf'); 
	
	var $ex_file = document.getElementById('ex_file'); 
	
	$ex_file.on("click", function(){
		
		$.ajax({
			url: contextPath + "/member/MemberChangeProfilePictureAction.me",
			type: 'get',
			dataType: 'text',
			success: function(data){
				
				var imgsrc = data;
				
				$prf.children('.profile').setAttribute('src', imgsrc);
				
			}
		})
	})
	
}*/


//프로필 사진 미리보기
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		$( 'img' ).remove( '.profile' );
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		img.setAttribute("class", "profile"); 
		document.querySelector("div#image_container").appendChild(img);
	}; reader.readAsDataURL(event.target.files[0]); 
} 

function changeFriendMenu(num){
	var str = "fMenu/inner_f_menu" + num + ".jsp"
	$(document).ready(function() { $("#menu").load(str)	});
}

function changeMyProfileMenu(num){
	var str = contextPath + "/app/board/profile/pMenu/inner_p_" + num + ".jsp"
	$(document).ready(function() { $("#menu").load(str)	});
}

function loadProfileSet() {
	$(document).ready(function() { 
		$("#prfContainer").load("inner_profileSet_checkPw.jsp");
	}); 
}

function changeProfileSet(name) {
	var profileSet = "inner_profileSet"+name+".jsp";
	var profileID = "#profile" +name;
		
	$(document).ready(function() { 
		$("#profileFrm").load("profile/pSet/"+profileSet);
		$(".changeProfilePage").css('font-weight','normal');
		$(profileID).css('font-weight','bolder');
 	}); 
}

//이름으로 친구 찾기
function searchFriendName(member_id){
	var name = $("input#search").val();
	
	if(name == ""){
		alert("이름을 입력해주세요.")
	}else{
		var $friendBarText = document.getElementById('friendBarText');
		$friendBarText.innerHTML = "검색 결과";
		
		var $friendcontent = document.getElementById('friendcontent');
		var $ff_list = document.getElementById('ff_list');
		removeAllChildNodes($ff_list);

		$.ajax({
			url: contextPath + "/member/MemberSearchfriendAction.me?name="+name,
			type: 'get',
			dataType: 'text',
			success: function(data){

				//data를 json으로 파싱
				jobj = JSON.parse(data);
//				console.log(jobj);
				
				for(var i = 0; i < jobj.length; i++){
					
					var f_div = document.createElement("div");
					f_div.id = "f";
					var hr = document.createElement("hr");
					
					var friendBox_div = document.createElement("div");
					friendBox_div.id = "friendBox";
					friendBox_div.setAttribute('class', 'friendBox');
						
					var imgbox_div = document.createElement("div");
					imgbox_div.setAttribute('class', 'imgbox');
					var imgbox_a = document.createElement("a");
					imgbox_a.setAttribute('href', 'javascript:openF_profile()');
					var imgbox_img = document.createElement("img");
					imgbox_img.setAttribute('class', 'fImg');
						var imgbox_img_src = contextPath + "/" + jobj[i]['member_picture'];
					imgbox_img.setAttribute('src', imgbox_img_src);
					
					imgbox_a.appendChild(imgbox_img);
					imgbox_div.appendChild(imgbox_a);
					
					
					var infobox_div = document.createElement("div");
					infobox_div.setAttribute('class', 'infobox');
					
					var infobox_a_fname = document.createElement("a");
					infobox_a_fname.id = 'fname'
					infobox_a_fname.setAttribute('class', 'fname');
					infobox_a_fname.setAttribute('onclick', 'openF_profile()');
					infobox_a_fname.innerHTML = jobj[i]['member_name'];
					
					var infobox_br = document.createElement("br");

					var infobox_a_fid = document.createElement("a");
					infobox_a_fid.id = 'fid'
					infobox_a_fid.setAttribute('class', 'fid');
					infobox_a_fid.setAttribute('onclick', 'openF_profile()');
					infobox_a_fid.innerHTML = jobj[i]['member_id'];
					
					infobox_div.appendChild(infobox_a_fname);
					infobox_div.appendChild(infobox_br);
					infobox_div.appendChild(infobox_a_fid);
					
						
					var addfriendbox_div = document.createElement("div");
					addfriendbox_div.setAttribute('class', 'addfriendbox');
					var addfriendbox_a = document.createElement("a");
					addfriendbox_a.id = 'addFriendBtn';
					var href = contextPath + "/member/MemberFriendRequestAction.me?send_id=" + member_id + "&receive_id=" + jobj[i]['member_id'];
					addfriendbox_a.setAttribute('href', href);
					addfriendbox_a.setAttribute('class', 'button small');
					addfriendbox_a.innerHTML = '친구 추가';
					addfriendbox_div.appendChild(addfriendbox_a);
					
					
					friendBox_div.appendChild(imgbox_div);
					friendBox_div.appendChild(infobox_div);
					friendBox_div.appendChild(addfriendbox_div);
					
					f_div.appendChild(friendBox_div);
					f_div.appendChild(hr);
					
					$ff_list.appendChild(f_div);
				
				}
				
			}
		})
			
	}

}

//자식 요소 모두 삭제
function removeAllChildNodes(parent) {
    while (parent.firstChild) {
        parent.removeChild(parent.firstChild);
    }
}

//친구 요청창 열기
function friendRequestOpen(sendCnt, receiveCnt){
	var $sendRequest = document.getElementById('sendRequest');
	removeAllChildNodes($sendRequest);

	var $receiveRequest = document.getElementById('receiveRequest');
	removeAllChildNodes($receiveRequest);
	
	$.ajax({
		url: contextPath + "/member/MemberFriendRequestOpen.me",
		type: 'get',
		dataType: 'text',
		success: function(data){

			//data를 json으로 파싱
			jobj = JSON.parse(data);
			
			if(sendCnt == 0){
				var no_h4 = document.createElement("h4");
				no_h4.id = 'none';
				no_h4.innerHTML = '보낸 요청이 없습니다.';
				$sendRequest.appendChild(no_h4);
			}else{
				for(var i = 0; i < sendCnt; i++){
					
					var f_div = document.createElement("div");
					f_div.id = "f";
					var hr = document.createElement("hr");
					
					var friendBox_div = document.createElement("div");
					friendBox_div.id = "friendBox";
					friendBox_div.setAttribute('class', 'friendBox');
					
					var imgbox_div = document.createElement("div");
					imgbox_div.setAttribute('class', 'imgbox');
					var imgbox_a = document.createElement("a");
					imgbox_a.setAttribute('href', 'javascript:openF_profile()');
					var imgbox_img = document.createElement("img");
					imgbox_img.setAttribute('class', 'fImg');
					var imgbox_img_src = contextPath + "/" + jobj[i]['send_picture'];
					imgbox_img.setAttribute('src', imgbox_img_src);
					
					imgbox_a.appendChild(imgbox_img);
					imgbox_div.appendChild(imgbox_a);
					
					
					var infobox_div = document.createElement("div");
					infobox_div.setAttribute('class', 'infobox');
					
					var infobox_a_fname = document.createElement("a");
					infobox_a_fname.id = 'fname'
						infobox_a_fname.setAttribute('class', 'fname');
					infobox_a_fname.setAttribute('onclick', 'openF_profile()');
					infobox_a_fname.innerHTML = jobj[i]['send_name'];
					
					var infobox_br = document.createElement("br");
					
					var infobox_a_fid = document.createElement("a");
					infobox_a_fid.id = 'fid'
						infobox_a_fid.setAttribute('class', 'fid');
					infobox_a_fid.setAttribute('onclick', 'openF_profile()');
					infobox_a_fid.innerHTML = jobj[i]['send_id'];
					
					infobox_div.appendChild(infobox_a_fname);
//					infobox_div.appendChild(infobox_br);
//					infobox_div.appendChild(infobox_a_fid);
					
					
					var addfriendbox_div = document.createElement("div");
					addfriendbox_div.setAttribute('class', 'addfriendbox');
					var addfriendbox_a = document.createElement("a");
					addfriendbox_a.id = 'FriendBtn';
					var cancleHref = contextPath + "/member/MemberRequestCancle.me?receive_id=" + jobj[i]['send_id'];
//					var cancle = jobj[i]['send_id'];
//					var cancleHref = "javascript:requestCancle('" + cancle + "');"
					addfriendbox_a.setAttribute('href', cancleHref);
					addfriendbox_a.setAttribute('class', 'button small cancleBtn');
					addfriendbox_a.innerHTML = '요청 취소';
					
					addfriendbox_div.appendChild(addfriendbox_a);
					
					
					friendBox_div.appendChild(imgbox_div);
					friendBox_div.appendChild(infobox_div);
					friendBox_div.appendChild(addfriendbox_div);
					
					f_div.appendChild(friendBox_div);
					f_div.appendChild(hr);
					
					$sendRequest.appendChild(f_div);
					
				}//end send for
			}//end if
			
			if(receiveCnt == 0){
				var no_h4 = document.createElement("h4");
				no_h4.id = 'none';
				no_h4.innerHTML = '받은 요청이 없습니다.';
				$receiveRequest.appendChild(no_h4);
			}else{
				for(var i = sendCnt; i < jobj.length; i++){
					
					var f_div = document.createElement("div");
					f_div.id = "f";
					var hr = document.createElement("hr");
					
					var friendBox_div = document.createElement("div");
					friendBox_div.id = "friendBox";
					friendBox_div.setAttribute('class', 'friendBox');
					
					var imgbox_div = document.createElement("div");
					imgbox_div.setAttribute('class', 'imgbox');
					var imgbox_a = document.createElement("a");
					imgbox_a.setAttribute('href', 'javascript:openF_profile()');
					var imgbox_img = document.createElement("img");
					imgbox_img.setAttribute('class', 'fImg');
					var imgbox_img_src = contextPath + "/" + jobj[i]['receive_picture'];
					imgbox_img.setAttribute('src', imgbox_img_src);
					
					imgbox_a.appendChild(imgbox_img);
					imgbox_div.appendChild(imgbox_a);
					
					
					var infobox_div = document.createElement("div");
					infobox_div.setAttribute('class', 'infobox');
					
					var infobox_a_fname = document.createElement("a");
					infobox_a_fname.id = 'fname'
						infobox_a_fname.setAttribute('class', 'fname');
					infobox_a_fname.setAttribute('onclick', 'openF_profile()');
					infobox_a_fname.innerHTML = jobj[i]['receive_name'];
					
					var infobox_br = document.createElement("br");
					
					var infobox_a_fid = document.createElement("a");
					infobox_a_fid.id = 'fid'
						infobox_a_fid.setAttribute('class', 'fid');
					infobox_a_fid.setAttribute('onclick', 'openF_profile()');
					infobox_a_fid.innerHTML = jobj[i]['receive_id'];
					
					infobox_div.appendChild(infobox_a_fname);
//					infobox_div.appendChild(infobox_br);
//					infobox_div.appendChild(infobox_a_fid);
					
					
					var addfriendbox_div = document.createElement("div");
					addfriendbox_div.setAttribute('class', 'addfriendbox');
					var okbtn = document.createElement("a");
					okbtn.id = 'FriendBtn';
					var okHref = contextPath + "/member/MemberRequestAccept.me?receive_id=" + jobj[i]['receive_id'];
					okbtn.setAttribute('href', okHref);
					okbtn.setAttribute('class', 'button small ok');
					okbtn.innerHTML = '수락';
					var nobtn = document.createElement("a");
					nobtn.id = 'FriendBtn';
					var noHref = contextPath + "/member/MemberRequestRefuse.me?receive_id=" + jobj[i]['receive_id'];
					nobtn.setAttribute('href', noHref);
					nobtn.setAttribute('class', 'button small no');
					nobtn.innerHTML = '거절';
					
					addfriendbox_div.appendChild(okbtn);
					addfriendbox_div.appendChild(nobtn);
					
					
					friendBox_div.appendChild(imgbox_div);
					friendBox_div.appendChild(infobox_div);
					friendBox_div.appendChild(addfriendbox_div);
					
					f_div.appendChild(friendBox_div);
					f_div.appendChild(hr);
					
					$receiveRequest.appendChild(f_div);
				}//end receive for

			}//end receive if
			
		}//end_successfunction
	})
}//end friendRequestOpen

//보낸 요청 취소
function requestCancle(receive_id){
	var layerFriendsInner = $("#layerFriendsInner");
	$.ajax({
		url: contextPath + "/member/MemberRequestCancle.me?receive_id=" + receive_id,
		type: 'get',
		dataType: 'text',
		success: function(data){
			
			//data를 json으로 파싱
			jobj = JSON.parse(data);
			friendRequestOpen(jobj[0]['sendCnt'], jobj[1]['receiveCnt']);
			
		}//end success function
	})//end ajax
}//end requestCancle

//받은 요청 수락
function requestAccept(receive_id){
	$.ajax({
		url: contextPath + "/member/MemberRequestAccept.me?receive_id=" + receive_id,
		type: 'get',
		dataType: 'text',
		success: function(data){

			//data를 json으로 파싱
			jobj = JSON.parse(data);
			friendRequestOpen(jobj[0]['sendCnt'], jobj[1]['receiveCnt']);
	
		}//end success function
	})//end ajax
}//end requestAccept

//받은 요청 거절
function requestRefuse(receive_id){
	$.ajax({
		url: contextPath + "/member/MemberRequestRefuse.me?receive_id=" + receive_id,
		type: 'get',
		dataType: 'text',
		success: function(data){

			//data를 json으로 파싱
			jobj = JSON.parse(data);
			friendRequestOpen(jobj[0]['sendCnt'], jobj[1]['receiveCnt']);
	
		}//end success function
	})//end ajax
}//end requestRefuse