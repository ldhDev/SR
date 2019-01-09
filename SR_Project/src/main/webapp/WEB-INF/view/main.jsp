<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나따릉이 메인화면</title>
<style type="text/css">
#wrap{
	width: 1020px;
	margin: 0 auto;
}

#main_img_bar{
	width: :100%;
	height: 170px;
	background-color: rgba(0,0,0,0.25);
}
#main_img{
	width: 1020px;
	height: 170px;
	margin: 0 auto;
}

#container{
	width: 1020px;
	height: 900px;
}

#map_div{
	width: 600px;
	height: 550px;
	box-sizing:border-box;
	float: left;
}
#map_search{
	width: 600px;
	height: 45px;
	font-family: "Roboto", sans-serif;
}
#map{
	width: 600px;
	height: 505px;
}
#map_search select{
	border-right-width:0px;
}

#login_div{
	padding-top:30px;
	width: 420px;
	height: 550px;
	float: left;
	background-color: rgba(238, 238, 232, 0.5);
	box-sizing: border-box;
}
#con2_title{
	margin-left:20px;
	margin-bottom:25px;
	width: 300px;
	height: 65px;
	line-height: 65px;
	font-size:24px;
	font-weight:800;
	font-family: "Nanum Gothic";
	border-bottom: 5px solid #0E7518;
}
#login_div input{
	margin: 0 auto;
	margin-left:35px;
	width: 350px;
	height: 40px;
	box-sizing: border-box;
	padding-left: 15px;
	margin-bottom: 10px;
}

#login_btn{ /* 현재 사용 안함*/
	margin: 0 auto;
	margin-top:30px;
	margin-left:35px;
	width: 350px;
	height: 50px;
	line-height:50px;
	text-align:center;
	font-family: "Nanum Gothic";
	font-weight:bold;
	background-color: #f3f3f3;
	font-family: "Roboto", sans-serif;
	cursor: pointer;
}
#login_need{
	width: 350px;
	height: 40px;
	text-align:center;
	font-size: 14px;
	font-weight: bold;
	margin-top: 130px;
}

#N_login_btn{ /* 현재 사용 안함*/
	margin: 0 auto;
	width: 278px;
	height: 55px;
}

#etc{
	margin-top:10px;
	width: 350px;
	height: 20px;
	text-align:right;
	font-size:12px;
	font-family: "Nanum Gothic";
	font-weight:bold;
}

#notice_list{
	margin-top: 35px;
	width: 600px;
	height: 310px;
	box-sizing:border-box;
	float: left;
}
#notice_title{
	margin-bottom:25px;
	width: 580px;
	height: 50px;
	line-height: 50px;
	font-size:28px;
	font-weight:800;
	font-family: "Nanum Gothic";
	border-bottom: 3px solid #0E7518;
	float: left;
}
#notices{
	clear:both;
	width: 580px;
	float:left;
	height: 200px;
	line-height: 200px;
	text-align: center;
	border-bottom: 2px dashed #d4f8e2;
}

#weather{
	margin-top: 35px;
	width: 410px;
	height: 320px;
	box-sizing:border-box;
	float: left;
}


#weather_title{
	margin-left:20px;
	width: 410px;
	height: 50px;
	line-height: 50px;
	text-align:left;
	font-size:28px;
	font-weight:800;
	font-family: "Nanum Gothic";

}
#sub_title{
	box-sizing:border-box;
	width: 410px;
	height: 20px;
	line-height: 0px;
	text-align:left;
	font-size:18px;
	font-family: "Nanum Gothic";
	margin-bottom: 20px;
}
#weather_info{
	margin-top:15px;
	width: 410px;
	height: 180px;
	box-sizing: border-box;
	padding-left: 40px;
	text-align: center; 
	background-color: #f0f6f0;

}
#w_img{
	margin-top:45px;
	width: 100px;
	height: 100px;
	text-align:center;
	float: left;
}
#w_temp{
	margin-top:45px;
	width: 140px;
	height: 100px;
	line-height:100px;
	float: left;
	font-size:60px;
	font-weight:800;
	font-family: "Nanum Gothic";
}
#w_wind{
	margin-top:55px;
	width: 110px;
	height: 40px;
	line-height:40px;
	float: left;
	font-size:14px;
	font-weight:700;
	font-family: "Nanum Gothic";
	text-align:left;
	box-sizing: border-box;
	padding-left: 15px;
}
#w_hu{
	width: 110px;
	height: 40px;
	line-height:40px;
	float: left;
	font-size:14px;
	font-weight:700;
	font-family: "Nanum Gothic";
	text-align:left;
	box-sizing: border-box;
	padding-left: 15px;
}


#weather_etc{
	clear:both;
	width: 410px;
	height: 35px;
	line-height:35px;
	text-align:center;
	font-size:14px;
	font-weight:bold;
	background-color: gray;
	color: white;
	font-family: "Nanum Gothic";
}

</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){ 
	lat = null;
	lon = null;
	
	navigator.geolocation.getCurrentPosition(function(position) {
		  //do_something(position.coords.latitude, position.coords.longitude);
		  lat = position.coords.latitude;
		  lon = position.coords.longitude;
		  
		// de,lo고척근린공원 고척도서관 앞','구로구','서울특별시 구로구 고척로45길 31구로구 고척동 산 9-14',10,'37.505135','126.852760');

			var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=c0ebe0d171c3c649371ea1781fb397ce";
			//var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=37.477885&lon=126.878985&appid=c0ebe0d171c3c649371ea1781fb397ce";

		    $.ajax({

		        url: apiURI,
		        dataType: "json",
		        type: "GET",
		        async: "false",
		        success: function(resp) {
		        	$("#w_temp").html(Math.floor((resp.main.temp- 273.15))+"℃" );
		            //$("#desc").append("날씨 : "+ resp.weather[0].main );
		            //$("#asd").append("상세날씨설명 : "+ resp.weather[0].description  );
		            $("#w_wind").html("바람   : "+ resp.wind.speed +"m/s");
	            	$("#w_hu").html ("습도 : "+ resp.main.humidity+"%");
		            var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
		            $("#w_img").html("<img src='"+imgURL+"' style='height:80px;width:80px;display:block;'><span style='font-weight:bold'>"+resp.weather[0].main+"</span>");
		            

		        } //석세스
		    })//에이잭스
		//////////////////////////////////////////////////////////AJAX
		
		
		});//바로 위에거
	
	if(lat == null || lon == null){
		lat = "37.477885";
		lon = "126.878985";
		
		// de,lo고척근린공원 고척도서관 앞','구로구','서울특별시 구로구 고척로45길 31구로구 고척동 산 9-14',10,'37.505135','126.852760');

		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=c0ebe0d171c3c649371ea1781fb397ce";
		//var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=37.477885&lon=126.878985&appid=c0ebe0d171c3c649371ea1781fb397ce";

	    $.ajax({

	        url: apiURI,
	        dataType: "json",
	        type: "GET",
	        async: "false",
	        success: function(resp) {
	        	$("#w_temp").html(Math.floor((resp.main.temp- 273.15))+"℃" );
	            //$("#desc").append("날씨 : "+ resp.weather[0].main );
	            //$("#asd").append("상세날씨설명 : "+ resp.weather[0].description  );
	            $("#w_wind").html("바람   : "+ resp.wind.speed +"m/s");
	            $("#w_hu").html ("습도 : "+ resp.main.humidity+"%");
	            var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
	            $("#w_img").html("<img src='"+imgURL+"' style='height:80px;width:80px;display:block;'><span style='font-weight:bold'>"+resp.weather[0].main+"</span>");
	            
	        } //석세스
	    })//에이잭스
	//////////////////////////////////////////////////////////AJAX
	}	
});
</script>

</head>
<body>
<div id="main_img_bar">
	<div id="main_img">
		<img src="img/main_img.jpg" style="height: 170px;width: 1020px;">
	</div>
</div>

<div id="wrap">
<div id="container">

<div id="map_div">
	<div id="map_search">
		<select style="height: 45px;width: 180px; box-sizing: border-box;float: left;">
			<option>대여소 이름</option>
			<option>대여소 번호</option>
		</select>
		<input type="text" name="find" style="height: 45px;width: 420px; box-sizing: border-box; padding-left:10px; float: left;">
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

<!-- 비로그인시 로그인창 표시 , 로그인시 즐겨찾기 정보가 표시 -->
<div id="login_div">
	<div id="con2_title">
		즐겨찾는 대여소
	</div>
	
  <%
    String clientId = "SXBfAVH8cGbb5AJWQWbQ";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/SR_Project/main2.bike", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  <div id="login_need">
 		로그인이 필요한 서비스입니다
  </div>
  <div id="N_login_btn">
  	<a href="<%=apiURL%>"><img height="55" src="${path }/img/NIL_white.PNG"/></a>
  </div>
	
<!-- 	 ........... ㅇ /  /  /  /  /  /  /  /  / 
	<input type="text" name="id" class="login_input" placeholder="ID를 입력해주세요">
	<input type="text" name="pass" class="login_input" placeholder="비밀번호를 입력해주세요">
	
	<div id="login_btn" class="btns" onmouseover="this.style.backgroundColor='#add89a'" onmouseleave="this.style.backgroundColor='#F0F5ED'" style="background-color:#F0F5ED; ">로그인하기</div>
	<div id="etc">ID 찾기&nbsp;&nbsp;|&nbsp;&nbsp;비밀번호 찾기&nbsp;&nbsp;|&nbsp;&nbsp;회원가입</div>
 -->
</div><!-- login_div 닫음 -->

<div id="notice_list">
	<div id="notice_title">
		Notice <span style="color:gray; font-size: 12px;font-weight: 600;">- 공지사항</span>
	</div>
	<!-- SQL이랑 JSTL 이용해서 만들것 -->
	<div id="notices">
		공지사항을 등록해주세요
	</div>
</div>

<div id="weather">
	<div id="weather_title">
		Weather<br>
		<div id="sub_title" style="font-size: 12px;font-weight: 600;">현위치 날씨정보</div>
	</div>
	
	<div id="weather_info">
		<div id="w_img">
		
			<div id="desc"></div>
		</div>
		<div id="w_temp">
		</div>
		<div id="w_wind">
		</div>
		<div id="w_hu">
		</div>
	</div>
	
	
	<div id="weather_etc">
		※ 위치정보 제공 거부시 가산디지털단지 지역의 날씨가 제공됩니다.
		<span style="color: black;">정보제공자 https://openweathermap.org</span>
	</div>
</div>
<div id="asd"></div>
</div><!-- container 닫음 -->
</div><!-- wrap 닫음 -->
</body>
</html>
