/**
* 지도 로딩 순서 제어 자바스크립트
 */
//주소를 보여주는 Div 태그
var locationAddress = $('#locationAddress');
var postBtn = $('#postBtn');
//var contextPath = "${pageContext.request.contextPath}";

function divHide() {
	locationAddress.hide();
	postBtn.hide();
}

function divShow() {
	locationAddress.show();
	postBtn.show();
}

//윈도우 영역 밖의 핸들링되지 않은 버튼으로 히스토리 변경 시 실행 Func
function callbackFunction() {
	window.history.forward();
}

//로그인 후 뒤로가기 막기
function backControl() {
	//윈도우 내에서 마우스 위치 확인하기 위한 플래그
	window.innerDoc = false;

	window.addEventListener('mouseover', function(event) {
		window.innerDoc = true;
	});
	window.addEventListener('mouseout', function(event) {
		window.innerDoc = false;
	});

	//바로 이전 페이지인 로그인으로 이동하는 것 막기위한 history 추가
	history.pushState({
		page : "first"
	}, document.title, location.pathname + '#first');

	window.addEventListener('popstate', function(event) {
		//history state 추가하여 페이지 이동 막기(뒤로가기 막기)
		history.pushState({
			page : "historyChanged"
		}, document.title, location.pathname + '#changed');

	});
	
	//윈도우 영역 밖에서 히스토리 변경이 발생할 경우 
	if(!window.innerDoc){
		callbackFunction();
	}
}
/**
 * 페이지 이동 시 location 변경이 필요하여 사용하는 메소드
 * @returns
 */
function moveFromOther(mode) {
	switch (mode) {
	case 'around':
		location.replace("boardMapPage.jsp");
		mapAroundMode();
		break;
	case 'posting':
		location.replace("boardMapPage.jsp");
		mapSequence('true');
		//window.onload = mapPostingMode();
		break;
	}
}


//default 모든 게시글의 핀만 노출, 핀 클릭시 게시판 페이지 이동
function mapSequence(name) {
	init();
	divHide();
	getPins();	
	if(name == 'undefined'){ mapSearchMode(); return;}
	else {
		setTimeout(() => {
			console.log("현재 위치 로딩 완료");
			showMarkers(kakaoMapLoad());
		}, 350);
		
		if(name) mapPostingMode();
	}
}
/*
//around 친구 의 게시글 랜덤 노출 페이지로 이동
function mapAroundMode() {
	init();
	divHide();
	setTimeout(() => {
		//console.log("어라운드 페이지");
		showMarkers(kakaoMapLoad());
	}, 350);
}
*/
//search 친구 검색이나 게시글 검색 페이지로 이동
function mapSearchMode() {
	//console.log("search페이지 링크 삽입");
	location.replace("search.jsp");
//	var str = contextPath + "/app/error/ready.html";
//	location.replace(str);
	return null;
}

//posting 지도의 클릭한 위치를 가지고 게시글 에디터로 이동할 수 있는 모드
function mapPostingMode() {
	var latLng = null;
	
	init();
	divShow();
	setTimeout(() => {
		console.log("게시글 에디터 넘어가기");
		clickMarker(kakaoMapLoad());
	}, 300);
	
	return latLng;
}
