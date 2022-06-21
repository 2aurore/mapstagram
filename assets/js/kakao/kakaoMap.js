/**
 * DB에서 핀을 가져와서 뿌리기 위한 js
 */
var jObj;

function getPins() {
	$.ajax({
		url: contextPath+ "/map/allPosition.bo",
		dataType: 'text',
		success : function(data) {
			console.log("pin 가져오기 성공");
			data = decodeURIComponent(data);
			for(let i=0; i<data.length; i++){
				data = data.replace("+", " ");
			}
			jObj = JSON.parse(data);
			//console.log(data);
			//console.log(jObj[1]['lat']);
		},
		error: function(){
			console.log("모든 pin 위치 불러오기 오류");
		}
	});
}



/**
 * 카카오 맵 구현 스크립트
 */
function kakaoMapLoad() {
	//console.log("현재 위치 1 : " + latitude + ", "+ longitude);
	var options = {
			center: new kakao.maps.LatLng(latitude, longitude),
			level: 3
	};
	
	var container = document.getElementById('map');
	var map = new kakao.maps.Map(container, options);
	
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	return map;
}

//여러개의 마커를 표시하는 func
function showMarkers(map) {
		
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions=[];
	for(var i=0; i<jObj.length; i++){
		var map_json = new Object();
		var str = jObj[i]['juso_2'];
		var result = str.substring(0, str.indexOf('동')+1);
		
		map_json.content = "<div>" + result + " <span id='" + jObj[i]['position_serial'] +"'>"+jObj[i]['position_serial']+"</span></div>";
		map_json.latlng = new kakao.maps.LatLng(jObj[i]['lat'], jObj[i]['lng']);
		positions.push(map_json);
	}
	
		//console.log(positions)
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

	for (var i = 0; i < positions.length; i ++) {
		 // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng, // 마커의 위치
			image : markerImage // 마커 이미지 
		});
		// 마커에 표시할 인포윈도우를 생성합니다 
		var infowindow = new kakao.maps.InfoWindow({
			content: positions[i].content // 인포윈도우에 표시할 내용
		});
		// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		
		(function(marker, infowindow) {
			// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
			kakao.maps.event.addListener(marker, 'mouseover', function() {
				var beginIdx = infowindow.bc.indexOf("'") + 1;
				
				infowindow.open(map, marker);
				var serial = infowindow.bc.substr(beginIdx);
				var endIdx = serial.indexOf("'");
				serial = serial.substr(0, endIdx);
				markerClickEvent(map, marker, serial);
			});

			// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
			kakao.maps.event.addListener(marker, 'mouseout', function() {
				infowindow.close();
			});
		})(marker, infowindow);
	} // end for
	
}

	
function markerClickEvent(map, marker, serial) {
	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var iwContent = '<div style="padding:5px;">'
		+'<a href="javascript:getMyboard('+ serial + ')" class="btn-layer">게시글 보러가기</a>'
		+'</div>', 
		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
//	인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		content : iwContent,
		removable : iwRemoveable
	});

//	마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		// 마커 위에 인포윈도우를 표시합니다
		infowindow.open(map, marker);  
	});
}


function post(latLng){
	/* DOM으로 input hidden value값에 넣어주기 */
	$("#lat").val(latLng.getLat());
	$("#lng").val(latLng.getLng());
	//hidden에 정상적으로 삽입
	//console.log($("#lat").val()+""+ $("#lng").val());
}
/**
 * 클릭한 위치의 주소를 hidden되어있는 input 태그에 입력
 */
function jusoText() {
	var juso = $("#selectAddr").text();
	
	$("#juso").val(juso);
	//console.log("jusoText : "+juso);
	
	$("#juso_1").val( $('#selectAddr').contents('#juso_a').text() );
	$("#juso_2").val( $('#selectAddr').children('#juso_b').text() );
}

function clickPosition() {
	jusoText(); 

	var juso_1 = $("#juso_1").val().trim(); 
	var juso_2 = $("#juso_2").val().trim();
	
	if (juso_1 == '' && juso_2 == '') {
		alert("지도에서 위치를 선택하세요!");
	}
	else {
		action();
	}
}

function action(){
	setTimeout(() => {
		$("#postFrm").submit();
	}, 300);
}

//지도에서 클릭한 위치의 좌표를 주소로 출력하는 func // 완성
function clickMarker(map) {
	
	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

	var geocoder = new kakao.maps.services.Geocoder();
	
	function searchDetailAddrFromCoords(coords, callback) {
		// 좌표로 법정동 상세 주소 정보를 요청합니다
		geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		
		 searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		        if (status === kakao.maps.services.Status.OK) {
		        	
		        	var addrStr = '<p id="selectAddr" style="line-height: 2.1;">';
		            var detailAddr = !!result[0].road_address ? '도로명 : <span id="juso_a">' + result[0].road_address.address_name + '</span></br>' : '';
		            detailAddr += '지번 : <span id="juso_b">' + result[0].address.address_name + '</span>';
		            
		            var content = '<div class="bAddr" >' +
		                            addrStr + detailAddr + 
		                        '</p></div>';
		            
		            $('bAddr').closest().css('width','max-content');
		            
		            // 마커를 클릭한 위치에 표시합니다 
		            marker.setPosition(mouseEvent.latLng);
		            marker.setMap(map);

		            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		            infowindow.setContent(content);
		            infowindow.open(map, marker);
		            
		            post(mouseEvent.latLng);
		        }   
		    });
	});

}


