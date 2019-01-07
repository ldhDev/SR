<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	/*안돼면 삭제할것*/
	-webkit-text-size-adjust: antialiased;
	-moz-osx-font-smoothing: grayscale;
	font-smoothing: antialiased;
}
#wrap{
	width: 1020px;
	margin: 0 auto;
	margin-top: 30px;
}

#map_div{
	width: 1020px;
	height: 450px;
	box-sizing:border-box;
	margin-bottom: 40px;
}
#map_search{
	width: 1020px;
	height: 45px;
	font-family: "Roboto", sans-serif;
}
#map{
	width: 1020px;
	height: 405px;
}
#map_search input,select{
	border-width:1px;
	border-color: black;
}
#map_search input{
	border-left-width: 0px;
}


#station_title{
	width: 1020px;
	height: 65px;
	box-sizing: border-box;
	padding-left: 30px;
	border-bottom: 5px solid #85d179;
}
#station_name{
	width: 960px;
	height: 40px;
	line-height: 40px;
	float:left;
	font-size:30px;
	font-weight:800;
	font-family: "Nanum Gothic";
	letter-spacing: -1px;
}
#station_etc{
	width: 960px;
	height: 20px;
	line-height:20px;
	float:left;
}
#station_etc span{
	float:right;
}

#station_info{
	height: 262px;
	width: 1020px;
	box-sizing: border-box;
	border: 1px solid #d6d6d6;
	border-top: 0px;
	margin-bottom: 20px;
}

#info_L{
	height: 261px;
	width: 509px;
	float: left;
}
#rest_bike{
	height: 130px;
	width: 254px;
	float: left;
}
#score{
	height: 130px;
	width: 254px;
	float: left;
}
#board{
	height: 130px;
	width: 254px;
	float: left;
}
#local_weather{
	height: 130px;
	width: 254px;
	float: left;
}
.line_vertical{
	height: 105px;
	width: 1px;
	background-color:#d6d6d6;
	float: left;
}
.line_hor{
	height: 1px;
	width: 449px;
	background-color:#d6d6d6;
	float: left;
	margin-left: 30px;
}



#info_R{
	height: 261px;
	width: 508px;
	float: left;
}
#chart_title{
	height: 70px;
	line-height:70px;
	width: 508px;
	font-size:24px;
	font-weight:800;
	font-family: "Nanum Gothic";
	box-sizing: border-box;
	padding-left: 15px;
	background-color: gray;
}

#comment_title{
	height: 50px;
	width: 1020px;
	background-color: gray;
}


</style>

<meta charset="EUC-KR">
<title>SR 대여소 상세정보 안내</title>
</head>
<body><div id="wrap">

<div id="map_div">
	<div id="map_search">
		<select style="height: 45px;width: 200px; box-sizing: border-box;float: left;">
			<option>대여소 이름</option>
			<option>대여소 번호</option>
		</select>
		<input type="text" name="find" style="height: 45px;width: 820px; box-sizing: border-box; padding-left:10px; float: left;">
	</div>

	<div id="map"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f692a5cbdd7deb058db63ec9f3045a3"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.477885, 126.878985), // 지도의 중심좌표 (학원)
	        level: 4 // 지도의 확대 레벨
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

	
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
	
	var positions = new Array();
	
	window.onload = function() {
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new daum.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
	};
	
	</script>

</div><!-- map_div 닫음 -->

<c:forEach items="${stationList }" var="station">
		<script type="text/javascript">
			var content = {
					content: '<div>${station.name}</div>', 
			        latlng: new daum.maps.LatLng("${station.latitude}", "${station.longtitude}")
			}
			positions.push(content);
		</script>
</c:forEach>

<div id="station_title">
	<div id="station_name">1834. 월드 메르디앙 벤처센터 2차 ♥ (즐찾숫자)</div>
	<div id="station_etc">주소주소주소주소주소주소주소  <span>조회시간 2018.12.12 15:11:11</span></div>

</div><!-- station_title 닫음 -->


<div id="station_info">
	<div id="info_L">
		<div id="rest_bike">
		</div>
			<div class="line_vertical" style="margin-top: 25px;"></div>
		<div id="score">
		asfasfasfafasf
		</div>
			<div class="line_hor"></div>
		<div id="board">
		</div>
			<div class="line_vertical"></div>
		<div id="local_weather">
		</div>
	</div><!-- info_L 닫음 -->
	
	<div style="height:190px; width:1px; background-color:#d6d6d6; float: left; margin-top: 35px;"></div>
	
	<div id="info_R">
		<div id="chart_title">
			대여소 이용 통계정보
		</div>
	</div><!-- info_R 닫음 -->
</div>

<div id="comment_title">
	대여소 한줄평 및 평가
</div>

</div></body>
</html>