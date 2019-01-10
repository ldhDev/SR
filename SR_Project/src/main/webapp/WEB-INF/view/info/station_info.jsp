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
	margin-bottom: 50px;
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

#score_cnt{
	height:10px;
	line-height:5px;
	width:250px;
	font-size: 12px;
	font-weight: bold;
	color: black;
	text-align: center;
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
	line-height:39px;
	width: 80px;
	color: white;
	font-size:16px;
	font-weight:700;
	font-family: "Nanum Gothic";
	float: right;
	text-align:center;
	background-color: green;
}

#comment_line{
	width:780px;
	height:2px;
	background-color:#85d179;
	margin-bottom: 25px;
	margin-top: 35px;
}

#comment_list{
	width: 960px;
	margin: 0 auto;
}

.list_panel{
	width: 960px;
	height: 139px;
	margin: 0 auto;
	border-bottom: 1px dashed #99bf93;
	margin-bottom: 20px;
}
.user_star{
	width: 960px;
	height: 40px;
	line-height:40px;
	text-align: left;
	color: #189d0e;
	font-size:26px;
	font-weight:900;
	font-family: "Nanum Gothic";
}
.user_star span{
	color: black;
	font-size: 22px;
}
.user_comment{
	width: 960px;
	height: 60px;
	line-height:24px;
	font-size:16px;
	font-family: "Nanum Gothic";
	box-sizing: border-box;
	padding: 5px 40px;
	word-break:break-all;
}

.comment_info{
	width: 960px;
	height: 29px;
	line-height:29px;
	text-align: right;
	font-size:12px;
	font-family: "돋움";
	color:gray;
}

#not_exist{
	width: 880px;
	height: 280px;
	line-height:280px;
	font-weight:700;
	font-size:22px;
	font-family: "Nanum Gothic";
	border-top: 5px solid #85d179;
	border-bottom: 5px solid #85d179;
	text-align: center;
	margin-bottom: 40px;
}

</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){ 
		
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=${!empty info.latitude?info.latitude:37.477885}&lon=${!empty info.longitude?info.longitude:126.878985}&appid=c0ebe0d171c3c649371ea1781fb397ce";

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
	
	$.ajax({
	    		url: "http://openapi.seoul.go.kr:8088/744c44676964646f3832527170746b/json/bikeList/${info.call_no-5}/${info.call_no+5}",
	    		dataType: "json",
	    		type: "GET",
		        async: "false",
				success: function(data){
					for(var i=0;i<data.rentBikeStatus.row.length;i++){
						
						if(data.rentBikeStatus.row[i].stationId=='${info.station_id}'){
							$("#rest").html(data.rentBikeStatus.row[i].parkingBikeTotCnt);
						}
					}
				}
			})
	//////////////////////////////////////////////////////////AJAX

});
</script>

<meta charset="EUC-KR">
<title>SR 대여소 상세정보 안내</title>
</head>
<body><div id="wrap">

<div id="map_div">
<div id="map"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f692a5cbdd7deb058db63ec9f3045a3"></script>
	<script>

	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
			
			center: new daum.maps.LatLng(${!empty info.latitude?info.latitude:37.477885}, ${!empty info.longitude?info.longitude:126.878985}),  // 지도의 중심좌표 (학원)
	        level: 4 // 지도의 확대 레벨 
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

	function makeOverListener2(map, marker,id, infowindow) {
	    return function() {
	    	var today=new Date();
	    	var sos=true;
	    	$.ajax({
	    		url: "http://openapi.seoul.go.kr:8088/744c44676964646f3832527170746b/json/bikeList/1/1000",
	    		dataType: "json",
	    		type: "GET",
		        async: "false",
				success: function(data){
					for(var i=0;i<data.rentBikeStatus.row.length;i++){
						
						if(data.rentBikeStatus.row[i].stationId==id){
							infowindow.setContent("자전거 남은 수: "+data.rentBikeStatus.row[i].parkingBikeTotCnt+"<br> 조회 시간 : "+today.toTimeString());
							sos=false;
							
						}
					}
				}
			})
			if(sos==true){
				$.ajax({
					url: "http://openapi.seoul.go.kr:8088/744c44676964646f3832527170746b/json/bikeList/1001/2000",
					dataType: "json",
					type: "GET",
			        async: "false",
					success: function(data){
						for(var j=0;j<data.rentBikeStatus.row.length;j++){
							
							if(data.rentBikeStatus.row[j].stationId==id){
								infowindow.setContent("자전거 남은 수: "+data.rentBikeStatus.row[j].parkingBikeTotCnt+"<br> 조회 시간 : "+today.toTimeString());
								sos=false;
								
							}
						}
					}
				})
			}
	        infowindow.open(map, marker);
	    };
	}
	
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
		        position: positions[i].latlng, // 마커의 위치
		        clickable: true
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new daum.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		    var id=positions[i].id
		    var infowindow2 = new daum.maps.InfoWindow({
		        content: "조회중입니다.", // 인포윈도우에 표시할 내용
		        removable: true
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		    daum.maps.event.addListener(marker, 'click', makeOverListener2(map, marker,id, infowindow2));
		}
	};
	
	</script>

</div><!-- map_div 닫음 -->

<c:forEach items="${stationList }" var="station">
		<script type="text/javascript">
			var content = {
					content: '<div>${station.name}</div>', 
			        latlng: new daum.maps.LatLng("${station.latitude}", "${station.longitude}"),
					id: "${station.station_id}"
			}
			positions.push(content);
		</script>
</c:forEach>


<!-- 대여소 지정 있고 페이지 입장 -->
<c:if test="${info_open == 1 }">

<div id="station_title">
	<div id="station_name">${info.number} . ${info.name}&nbsp;&nbsp;<span id="heart">♥</span><span id="bookmark">(즐찾숫자)</span></div>
	<div id="station_etc">${info.address}  <span>조회시간 <fmt:formatDate value="${info_time}" pattern="yyyy.MM.dd HH:mm:ss"/></span></div>

</div><!-- station_title 닫음 -->

<div id="station_info">
	<div id="info_L">
		<div id="rest_bike">
			<div id="rest_title">대여가능 자전거</div>
			<div id="rest_cnt"><span id="rest">5</span> / ${info.rack_totCnt}</div>
		</div>
			<div class="line_vertical" style="margin-top: 25px;"></div>
		<div id="score">
			<div id="score_title">대여소 평점</div>
			<div id="score_star">
				★★★★☆ 
				<span style="font-size: 20px;">${!empty station_score?station_score!=0.0?station_score:0:0}<span style="font-size: 22px;">/</span>5</span>
			</div>
			<div id="score_cnt">( ${score_cnt } )</div>
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

<div id="comment_list">
	<!-- JSTL로 반복 넣을것 -->
	
	<div class="list_panel">
		<div class="user_star">
			★★★★☆ <span>&nbsp;5</span>
		</div>
		<div class="user_comment">
			아 됐다 걍 이렇게 가`~!---
		</div>
		<div class="comment_info">
			김개발좌  |  2019-01-09
		</div>
	</div>
	
	<div class="list_panel">
		<div class="user_star">
			★★★★☆ <span>&nbsp;4</span>
		</div>
		<div class="user_comment">
			백바이트 글자 채우기백바이트 글자 채우기백바이트 글자 채우기백바이트 글자 채우기백바이트 글자 채우기
			백바이트 글자 채우기백바이트 글자 채우기백바이트 글자 채우기백바이트 글자 채우기백바이트 글자 채우기
		</div>
		<div class="comment_info">
			김개발좌  |  2019-01-09
		</div>
	</div>
	<div class="list_panel">
		<div class="user_star">
			★★★★☆ <span>&nbsp;3</span>
		</div>
		<div class="user_comment">
		</div>
		<div class="comment_info">
			김개발좌  |  2019-01-09
		</div>
	</div>
	
</div><!-- review 끝 -->

</c:if> <!-- c:if info_open == 1 의 끝  -->


<!-- 대여소 지정 없이 페이지 입장 -->
<c:if test="${info_open == 0 }">
<div id="not_exist">
확인하실 대여소를 선택해주세요
</div>
</c:if><!-- c:if info_open == 1 의 끝  -->

</div></body>
</html>