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
	margin-bottom: 30px;
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
	height: 35px;
	line-height: 35px;
	float:left;
	font-size:28px;
	font-weight:800;
	font-family: "Nanum Gothic";
	letter-spacing: -1px;
}
#heart{
	color: #cd292a;
	font-size: 30px;
}
#bookmark{
	color: #cd292a;
	font-size: 20px;
}

#station_etc{
	width: 960px;
	height: 25px;
	line-height:25px;
	font-size:16px;
	font-family: "Nanum Gothic";
	float:left;
}
#station_etc span{
	font-family: "돋움";
	font-size:12px;
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
#rest_title{
	margin-top:25px;
	margin-bottom:10px;
	height: 25px;
	line-height: 25px;
	width: 254px;
	font-size: 20px;
	font-family: "Nanum Gothic";
	font-weight: 800;
	text-align: center;
}
#rest_cnt{
	height: 45px;
	line-height: 45px;
	width: 254px;
	font-size: 22px;
	font-family: "Nanum Gothic";
	font-weight: 800;
	text-align: center;
	
	box-sizing: border-box;
	padding-left: 40px;
}
#rest_cnt span{
	font-size: 56px;
	color: #ff0000;
}

#score_title{
	margin-top:25px;
	margin-bottom:5px;
	height: 25px;
	line-height: 25px;
	width: 250px;
	font-size: 20px;
	font-family: "Nanum Gothic";
	font-weight: 800;
	text-align: left;
	box-sizing: border-box;
	padding-left: 15px;
}
#score_star{
	height: 45px;
	line-height: 45px;
	width: 250px;
	font-size: 28px;
	font-family: "Nanum Gothic";
	font-weight: 800;
	color: #189d0e;
	text-align: center;
}
#score_star span{
	font-size: 24px;
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
#board_icon{
	margin-top: 15px;
	margin-left: 94px;
	height: 66px;
	width: 70px;
}
#board_title{
	height: 40px;
	line-height: 40px;
	width: 254px;
	text-align: center;
	font-size: 16px;
	font-family: "Nanum Gothic";
	font-weight: 800;
}

#local_weather{
	height: 130px;
	width: 254px;
	float: left;
}
#w_wrap{
	margin-top : 23px;
	width: 254px;
	height: 80px;
	box-sizing: border-box;
	padding-left: 35px;
}

#w_img{
	width: 80px;
	height : 80px;
	float: left;
}
#w_temp{
	width: 115px;
	height : 80px;
	line-height : 80px;
	font-size: 50px;
	font-family: "Nanum Gothic";
	font-weight: 800;
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
	line-height: 50px;
	width: 1020px;
	font-size:20px;
	font-weight:900;
	font-family: "Nanum Gothic";
	box-sizing: border-box;
}
#comment{
	height: 200px;
	width: 960px;
	border: 1px solid #d6d6d6;
	box-sizing: border-box;
}
#comment_star{
	height: 55px;
	line-height: 54px;
	width: 958px;
	padding-left:25px;
	box-sizing:border-box;
	font-size: 24px;
	font-weight:800;
	font-family: "Nanum Gothic";
	border-bottom: 1px dotted #d6d6d6;
}
.stars{
	color:gray;	
	font-size:28px;
	font-weight:900;
	font-family: "Nanum Gothic";
	letter-spacing:-3px;
	margin-right: 10px;
}
#write{
	height: 105px;
	width: 958px;
}
#write textarea{
	width: 958px;
	height: 104px;
	border: 0px;
	padding: 15px;
	padding-left:20px;
	padding-right:20px;
	box-sizing: border-box;
	background-color: #fafafa;
	resize: none;
}

#submit_line{
	height: 40px;
	line-height: 39px;
	width: 958px;
	border-top: 1px solid #d6d6d6;
	box-sizing: border-box;
	font-size: 14px;
	font-family: "돋움";
	font-weight:bold;
	text-align: right;
	color: gray
	
}

#sub_btn{
	margin-left:20px;
	height: 39px;
	width: 80px;
	color: white;
	font-size:18px;
	font-weight:800;
	font-family: "Nanum Gothic";
	float: right;
	text-align:center;
	background-color: green;
}

#comment_line{
	width:780px;
	height:2px;
	background-color:#85d179;
	margin-bottom: 35px;
	margin-top: 35px;
}

.review{
	width: 960px;
	height: 500px;
	margin: 0 auto;
	background-color: gray;
}

</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){ 
	lat = null;	//값 받아올것 메뉴클릭시에는 메인에서 있는 위치정보로 , 이 링크로 들어오면 가산으로 
	lon = null;
	
	if(lat == null || lon == null){
		lat = "37.477885";
		lon = "126.878985";
	}
		
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=c0ebe0d171c3c649371ea1781fb397ce";
		//var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=37.477885&lon=126.878985&appid=c0ebe0d171c3c649371ea1781fb397ce";

	    $.ajax({
	        url: apiURI,
	        dataType: "json",
	        type: "GET",
	        async: "false",
	        success: function(resp) {
	        	$("#w_temp").html(Math.floor((resp.main.temp- 273.15))+"℃" );
	            var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
	            $("#w_img").html("<img src='"+imgURL+"' style='height:80px;width:80px;'>");	            
	        } //석세스
	    })//에이잭스
	//////////////////////////////////////////////////////////AJAX

});
</script>

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
	<div id="station_name">1834. 월드 메르디앙 벤처센터 2차 <span id="heart">♥</span><span id="bookmark">(즐찾숫자)</span></div>
	<div id="station_etc">주소주소주소주소주소주소주소  <span>조회시간 2018.12.12 15:11:11</span></div>

</div><!-- station_title 닫음 -->


<div id="station_info">
	<div id="info_L">
		<div id="rest_bike">
			<div id="rest_title">대여가능 자전거</div>
			<div id="rest_cnt"><span>5</span> / 13</div>
		</div>
			<div class="line_vertical" style="margin-top: 25px;"></div>
		<div id="score">
			<div id="score_title">대여소 평점</div>
			<div id="score_star">★★★★☆ <span>4/5</span></div>
		</div>
			<div class="line_hor"></div>
		<div id="board">
			<div id="board_icon">
				<a href="${path }/main.bike"><img src="${path }/img/board_icon.png"></a>
			</div>
			<div id="board_title">대여소별 게시판</div>
		</div>
			<div class="line_vertical"></div>
		<div id="local_weather">
			<div id="w_wrap">
				<div id="w_img"></div>
				<div id="w_temp"></div>
			</div>
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
	대여소 한마디 및 평가
</div>

<div id="comment">
	<div id="comment_star">
		<span class="stars">
			<span id="star1" >★</span>
			<span id="star2" >★</span>
			<span id="star3" >★</span>
			<span id="star4" >★</span>
			<span id="star5" >★</span>
		</span> 
		<span id="sel_star">0</span> / 5&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;font-family: '돋움';color:gray;font-weight:normal;">- 이 대여소는 어떤가요?</span>
	</div><!-- comment_star 라인  -->
	<div id="write">
		<textarea placeholder="내용을 입력해주세요"></textarea>
	</div><!-- write 라인  -->
	<div id="submit_line">
		<span id="limit">0</span> / 200
		<div id="sub_btn">등록</div>
	</div><!-- submit_line 라인  -->
</div><!-- comment 라인  -->

<div id="comment_line"></div>

<div class="review">여따가 이렇게 하면 돼고 이제 DB 재작업 하자</div>

</div></body>
</html>