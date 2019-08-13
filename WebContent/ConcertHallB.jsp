<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>공연장 찿아오시는길</title>
    <style>

body {
background-image: linear-gradient(to top, #a8edea 0%, #fed6e3 100%);	
background-attachment: fixed;
  background-repeat: no-repeat;
}
.abcd{
	width:100%;
}
#cc{
	width: 450px;
	height: 500px;
	margin:0 auto;
	margin-left: 20%;
}
#dd{
	width: 450px;
	height: 500px;
	margin:0 auto;
	margin-right:20%;
}
	tr:nth-child(odd) {background-color: rgb(200,200,200);}
	
	tr:last-child{background-color: skyblue;}
	tr:first-child{background-color: skublue;}
	
body {
	text-align: center;
}
h1 {
	color:red;
}
h2{
	color:blue;
}
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:800px;height:400px;margin:20px auto;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:200px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>
<%@ include file="./form/header.jsp"%>
	<br/>
	<div class="abcd";>
		<img id="cc" src="images/cc.jpg"><img id="dd" src="images/dd.jpg">
	</div>
	
		<h1>디큐브씨어터에서 차원이다른</h1><br/>
		<h1>감동의 순간을 경험 하실수 있습니다.</h1><br/>
		<h3>디큐브씨어터는 1,242석 규모의 국내 최고층, 서남권 최대 규모의 공연장입니다.</h3><br/>
		<pre>◦ 야외 콘서트에서만 사용되던 L-ACOUSTICS 社의 K1시리즈 스피커를 실내 공연장에 도입하여 온 몸의 감각을 깨우는 생생한 무대 음향을 구현합니다.</pre><br/>
		<pre>◦ 무대 앞 선에서 객석 끝까지의 거리를 28m로 설계하여 어느 좌석에서도 공연자의 숨결을 생생하게 느낄 수 있는 최상의 관람 조건을 제공합니다.</pre><br/>
		<pre>◦ 뮤지컬은 물론 연극, 무용, 콘서트 등 어떤 장르의 공연에도 최적의 공연환경을 제공합니다.</pre><br/>
		<h3>리허설룸</h3><br/>
		<pre>편의시설 : 남녀탈의실 및 샤워실, 업라이트 피아노(1대), 발레 바(10개), 락커</pre><br/>
		<h3>분장실</h3><br/>
		<pre>그룹분장실 4개(최대 14명 수용 가능), 단독분장실 4개<br/>
		</br>편의시설 : 화장실 및 샤워실, 정수기, 냉장고</pre><br/>
		<h3>수선실</h3><br/>
		<pre>편의시설 : 세탁기, 건조기, 다리미, 미싱</pre><br/>
		<h3>그린룸</h3><br/>
		<pre>편의시설 : 소파, 의자, 정수기, 집진기</pre><br/>
		<h3>그 밖에 무대(9F)<br/>
		 상수의 퀵체인지룸, 프로덕션 사무실(무선인터넷 지원), 락커룸, 악기보관실을 지원합니다.</h3>
		<br/>
		<h1>----------------------------------------------------------------</h1>
		<h2>오시는길 안내</h2>
		
<div class="map_wrap">
	
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="디큐브아트센터" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fc8ab3698db7ab3ac3d09a0c9bc4a2e4&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
    
}
</script>
		<div style="width:100%;height:400px;margin: 0 auto; ">
	<div style="width:70%;height:400px;margin: 0 auto;">
	<div style="margin: 0 auto; width:60%;">
	<table border="1" id="board" style="width:100%;">
	<colgroup>
	
	<col width="20%">
	<col width="40%">
	<col width="40%">
	
	</colgroup>
		<tr>
			<th>주소</th><br/>
			<th>서울시 강남구 삼성로 534</th><th>공연장 안내전화 010-1235-1234</th>
		</tr>

		<tr height="120px">
			<th>교통안내</th>
			<th>지하철<br/> 
				1,2호선 신도림역 하차(1번 출구와 지하도로 연결) <br/>
				김포국제공항에서 오실 때 : 5호선 김포공항역 > 까치산역에서 2호선 환승 > 신도림역 하차 <br/>
				인천국제공항에서 오실 때 : 공항철도 인천국제공항역 > 홍대입구에서 2호선 환승 > 신도림역 하차<br/></th>
			<th>버스<br/>
				(신도림역 1번 출구 하차 시)<br/>
				영등포/구로 방향 : 10, 83, 88, 510, 11-1, 11-2(일반), 320, 301(좌석)<br/>
				 503, 670, 260, 160, 600(간선)<br/>
				 6515, 5714, 6512, 6513, 6637, 6640, 5615(지선)<br/>
				한별구림어린이집 or 포스사거리 앞 하차 - 도보2분<br/>
				 버스에서 하차하신 후 지하도를 통하여 신도림역 1번 출구로 나오시면 바로 연결되어 있습니다.</th>
		</tr>
	</table>
	</div>
	</div>
	</div>
	<%@ include file="./form/footer.jsp"%>
</body>
</html>