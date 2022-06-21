/**
 * Geolocation API를 이용한 자바 스크립트
 */


let latitude;	//위도
let longitude;	//경도

function init()
{
    window.navigator.geolocation.getCurrentPosition(current_position);
}
 
function current_position(position)
{
    latitude = position.coords.latitude;
    longitude = position.coords.longitude;
   // console.log("현재 위치 0 : " + latitude + ", "+ longitude);
}
 
