<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>다음 지도 API</title>
</head>
<body>
	<div id="map" style="width:100%;height:100vh;"></div>

	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=d24d618b0b4275936a4347b79f44a5c1&libraries=clusterer"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.553110, 126.972615), // 지도의 중심좌표-> 검색결과 
		        level: 3, // 지도의 확대 레벨
		        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		// 마커 클러스터러를 생성합니다 
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	        minLevel: 10 // 클러스터 할 최소 지도 레벨 
	    });
		
		/* var data = [
			[37.553110, 126.972615, '<div style="padding:5px;">내용</div>'], // [coordinate_x, coordinate_y, '<div style="padding:5px;">'name'</div>]
			[37.558489, 126.978329, '<div style="padding:5px;">내용2</div>'],
			[37.483327, 126.941617, '<div style="padding:5px;">내용3</div>'],
		] */
		
		var data = [
			<c:forEach var='m' items='${map}'>
				[${m.coordinate_x}, ${m.coordinate_y},'<div style="padding:5px;">내용</div>'],
			</c:forEach>
		]
		
		var markers = [];
		for (var i=0; i < data.length; i++){
			// 지도에 마커를 생성하고 표시한다
			var marker = new kakao.maps.Marker({
			    position: new kakao.maps.LatLng(data[i][0], data[i][1]), // 마커의 좌표 -> (data[i][coordinate_x], data[i][coordinate_y]),
			});
			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    content : data[i][2] // data[i]['name']
			});
			
			markers.push(marker);
			kakao.maps.event.addListener(
				marker, 
				'mouseover', 
				makeOverListener(map, marker, infowindow)
			);
		    kakao.maps.event.addListener(
		    	marker, 
		    	'mouseout', 
		    	makeOutListener(infowindow)
		    );
		}
		// 클러스터러에 마커들을 추가합니다
        clusterer.addMarkers(markers);
		
    	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
        function makeOverListener(map, marker, infowindow) {
            return function() {
                infowindow.open(map, marker);
            };
        }

        // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
        function makeOutListener(infowindow) {
            return function() {
                infowindow.close();
            };
        }
	</script>
</body>
</html>