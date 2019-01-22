<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.security.SecureRandom" %>
<%@page import="java.math.BigInteger" %>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:import url="/WEB-INF/view/jspHeader.jsp"/>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>

<html>

<head>
<meta charset="EUC-KR">
<title>나따릉이 메인화면</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style type="text/css">
#wrap{
	width: 1020px;
	margin: 0 auto;
}

#main_img_bar{
	width: :100%;
	height: 170px;
	background-color: rgba(0,0,0,0.25);
	margin-bottom: 10px;
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
	background-color: #f6f6f3;
}
#map{
	width: 600px;
	height: 505px;
	margin-top: 10px;
}
#map_search select{
	border-right-width:0px;
}

#login_div{
	padding-top:30px;
	width: 420px;
	height: 560px;
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
	font-weight:800;
	font-size:18px;
	font-family: "Roboto", sans-serif;
}

#bm_hello{
	margin-top: 25px;
	margin-bottom: 25px;
	width: 420px;
	height: 30px;
	line-height: 30px;
	font-weight:800;
	font-size:18px;
	text-align:center;
	box-sizing:border-box;
	padding-left:10px;
	font-family: "Roboto", sans-serif;
}

#bookmark{
	margin-top: 15px;
	margin:0 auto;
	width: 360px;
	height: 212px;
	border: 1px solid #cdcdcd;
}

.bm_list{
	margin: 0 auto;
	margin-bottom: 20px;
    width: 390px;
    height: 75px;
    padding-left: 10px;
    padding-top: 5px;
    border: 1px dotted #bccfc3;
    cursor: pointer;
}

.bm_none{
	width: 390px;
    height: 75px;
    line-height: 75px;
    text-align: center;
    color: rgba(49,117,43,0.35);
    font-weight: 600;
    font-size: 16px;
    font-family: "Roboto", sans-serif;
}

.bm_L{
	width:320px;
	height: 70px;
	padding-top:3px;
	float: left;
}
.bm_number{
	width: 320px;
    height: 20px;
    line-height: 20px;
    font-size: 16px;
    font-weight: 800;
    font-family: "Nanum Gothic";
}
.bm_name{
	width:320px;
	height: 45px;
    line-height: 45px;
    font-size: 24px;
    font-weight: 800;
    font-family: "Nanum Gothic";
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    
}

.bm_R{
	position:relative;
	width: 60px;
	height: 70px;
	float: left;
}
.bm_R_title{
	position: absolute;
    top: 0px;
    right: -11px;
    width: 90px;
    height: 20px;
    line-height: 20px;
    font-size: 12px;
    font-weight: 800;
    font-family: "Nanum Gothic";
}
.bm_rest{
	width: 60px;
    height: 70px;
    line-height: 90px;
    color: red;
    text-align: center;
    font-size: 36px;
    font-weight: 800;
    font-family: "Nanum Gothic";
    box-sizing: border-box;
    padding-right: 20px;
    float: left;
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
	/*margin-bottom:25px;*/margin-bottom:0px !important;
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
.notice_line{
	width: 580px;
	height: 39px;
	line-height: 39px;
	border-bottom: 1px solid #d8d8d8;
}
#notice_click{
	margin-top:26px;
	margin-right:20px;
	line-height: 15px;
	font-size:14px;
	font-weight:800;
	font-family: "Nanum Gothic";
	float: right;
	color:#8C8C8C;
}

.notice_line:last-child{
	width: 580px;
	height: 40px;
	line-height: 40px;
	text-align:left;
	border-bottom: 0px;
}
.notice_title{
	width: 480px;
	height: 39px;
	float: left;
	text-align:left;
	font-size: 16px;
}
.notice_title :hover{
	text-decoration: underline;
}

.notice_date{
	width: 100px;
	height: 39px;
	text-align:center;
	float: left;
	font-size: 12px;
	font-weight: bold;
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



.fa-bicycle
{
	color:#2aa034;
	font-size: 25px;
	padding-left: 50px;
}
.ff
{
	color : black;
	font-size:25px;
}

.bt1
{
	width:100px;
    background-color: #2aa034;
	color:white;
    text-align: center;
    text-decoration: none;
    font-size: 15px;
    margin: 4px;
    cursor: pointer;
    border-radius:10px;
    margin-left: 150px;
}

.bt1:hover
{
    background-color: white;
	color:#2aa034;
    border-radius:10px;
}

.fa-clock
{
	color:#2aa034;
	font-size: 25px;
	padding-left: 55px;
}
.fa-map-signs
{
	color:#2aa034;
	font-size: 25px;
	padding-left: 55px;
}
.ba
{
	background-color: #6df37d26;
	height: 200px;
}


.setmain
{
	width:400px;
	height:200px;
}

.nn
{
	color : black;
	font-size:18px;
}

.fa-search
{
	font-size:45px;
	color:green;
	background-color: #f6f6f3;
}

.iw
{
	color:blue;
	width:25px;
	height:20px;
}

.iif 
{
	color:black;
	width:450px;
	height: 70px;
	font-size:15px;
	background-color: #e9fdec;
	align-content: center;
}

/* 검색 바*/
#btn1
{
	height: 45px;
	width: 65px;
	margin-left: 5px;
	cursor: pointer;
}

#find
{
	background-color:white;height: 45px;width: 345px; box-sizing: border-box;float: left; background-color:#f6f6f3;  padding-left: 20px; font-size: 15px;
}
</style>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function(){ 
	lat = null;
	lon = null;
	
	navigator.geolocation.getCurrentPosition(function(position) {
		  lat = position.coords.latitude;
		  lon = position.coords.longitude;
		  
		// de,lo고척근린공원 고척도서관 앞','구로구','서울특별시 구로구 고척로45길 31구로구 고척동 산 9-14',10,'37.505135','126.852760');

			var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=c0ebe0d171c3c649371ea1781fb397ce";

		    $.ajax({

		        url: apiURI,
		        dataType: "json",
		        type: "GET",
		        async: "false",
		        success: function(resp) {
		        	$("#w_temp").html(Math.floor((resp.main.temp- 273.15))+"℃" );
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

	    $.ajax({

	        url: apiURI,
	        dataType: "json",
	        type: "GET",
	        async: "false",
	        success: function(resp) {
	        	$("#w_temp").html(Math.floor((resp.main.temp- 273.15))+"℃" );
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
		<select id="menu_such" style="height: 45px; width: 180px; box-sizing: border-box; float: left; font-size: 15px; padding-left: 35px;">
			<option>대여소 이름</option>
			<option>대여소 주소</option>
		</select>
		<input type="text" id="find" name="find"  placeholder="대여소명을 입력해주세요">
		<input type="button" id="btn1" value="검색"/>
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
	map.setMinLevel(3);
	map.setMaxLevel(5);
	

	
	//수정 0114 (2)
	
	
		window.onload = function() {
		
		
		//수정 시작

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			
				//수정 01/14
	
	
	var imageSrc = 'https://cdn.icon-icons.com/icons2/1465/PNG/512/615bicycle_100568.png', // 마커이미지의 주소입니다    
    imageSize = new daum.maps.Size(45, 45), // 마커이미지의 크기입니다
    imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new daum.maps.LatLng(positions[i].latitude, positions[i].longitude); // 마커가 표시될 위치입니다

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition, 
    image: markerImage // 마커이미지 설정 
});


//수정 0118_커피
var iif = '<div class="iif"><b>'+positions[i].content+'</b><br> 주소명 : '+positions[i].address+'</div>';
var infowindow = new daum.maps.InfoWindow({
	//content : positions[i].content
	content : iif
// 인포윈도우에 표시할 내용
});
var id = positions[i].id
var name = positions[i].name
var number = positions[i].number
var my_name=positions[i].content_split

//0118_pm_커피
var iw = '<div class="iw"><b>Loading...</b></div>';

var infowindow2 = new daum.maps.InfoWindow({
	//content : "조회중입니다.", // 인포윈도우에 표시할 내용
	content : iw,
	removable : true
});

var marker_target_info= {
		marker_target: marker,
		address: positions[i].address,
		name: my_name,
		number: number
}
marker_on_off.push(marker_target_info);
// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);  
	
	
	//수정 완료 


				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				// 이벤트 리스너로는 클로저를 만들어 등록합니다 
				// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				
				daum.maps.event.addListener(marker, 'mouseover',
						makeOverListener(map, marker, infowindow));
				daum.maps.event.addListener(marker, 'mouseout',
						makeOutListener(infowindow));
				daum.maps.event.addListener(marker, 'click', makeOverListener2(
						map, marker, id, name, number, infowindow2));
			}
		$("#btn1").click(function(){
			var menu_such=$("#menu_such option:selected").val();
			var find_value=$("#find").val();
			var such_zero= true;
			if(menu_such=="대여소 이름"){
				for(var i=0;i<marker_on_off.length;i++){
					if(find_value==null||find_value==""){break;}
					var marker_such=marker_on_off[i].marker_target;
					var address_such=marker_on_off[i].name;
					if(address_such.includes(find_value.trim())){// 본격 비교 문자열이 포함된다면 true
						marker_such.setMap(map); // 지도에 올린다.
						if(such_zero){
							map.setCenter(marker_such.getPosition());
						}
						such_zero=false;
					}else{// 문자열이 포함이 안된다면 false
						marker_such.setMap(null); // 지도에서 제거한다.
					}
				}	
			}else if(menu_such=="대여소 주소"){
				for(var i=0;i<marker_on_off.length;i++){
					if(find_value==null||find_value==""){break;}
					var marker_such=marker_on_off[i].marker_target;
					var address_such=marker_on_off[i].address;
					if(address_such.includes(find_value)){// 본격 비교 문자열이 포함된다면 true
						marker_such.setMap(map); // 지도에 올린다.
						if(such_zero){
							map.setCenter(marker_such.getPosition());
						}
						such_zero=false;
					}else{// 문자열이 포함이 안된다면 false
						marker_such.setMap(null); // 지도에서 제거한다.
					}
				}	
			}
			
			if(such_zero){
				alert("조회 정보가 없습니다.");
				for(var i=0;i<marker_on_off.length;i++){
					var marker_such=marker_on_off[i].marker_target;
					marker_such.setMap(map);
					$("#find").val("");
				}
			}
		})
		};
	
	
	//끝
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 

	function makeOverListener2(map, marker,id,name,number, infowindow) {
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
						var name = data.rentBikeStatus.row[i].stationName;
						var cnt = data.rentBikeStatus.row[i].parkingBikeTotCnt;
						if(cnt<4)
						{
							cnt="<t class=\"yellow\" style=\"color:red; font-size:25px;\"><b>"+cnt+"</b></t>";
						}
						else if(cnt<8)
						{
							cnt="<t class=\"yellow\" style=\"color:orange; font-size:25px;\"><b>"+cnt+"</b></t>";
						}
						else
						{
							cnt="<t class=\"ff\"><b>"+cnt+"</b></t>";
						}
						var time = today.toTimeString().substr(0,8);
						
						if(data.rentBikeStatus.row[i].stationId==id){
							infowindow.setContent("<div class=\"setmain\"><div class=\"ba\"><br><i class=\"fas fa-map-signs\">&nbsp</i>"
									+"<t class=\"nn\">"+name+"</t><br><br><i class=\"fas fa-bicycle\">&nbsp</i>"
									+"대여가능 대수 : "+cnt+" 대<br><br><i class=\"far fa-clock\">&nbsp</i> 조회 시간 : "+time+"<br>"
									+"<div><a href='${path}/info/station_info.bike?number="+number+"'><br><input class=\"bt1\" type='button' value='상세정보'></a><br></div></div>");
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
							var name = data.rentBikeStatus.row[j].stationName;
							var cnt = data.rentBikeStatus.row[j].parkingBikeTotCnt;
							if(cnt<4)
							{
								cnt="<t class=\"yellow\" style=\"color:red; font-size:25px;\"><b>"+cnt+"</b></t>";
							}
							else if(cnt<8)
							{
								cnt="<t class=\"yellow\" style=\"color:orange; font-size:25px;\"><b>"+cnt+"</b></t>";
							}
							else
							{
								cnt="<t class=\"ff\"><b>"+cnt+"</b></t>";
							}
							var time = today.toTimeString().substr(0,8);
							
							if(data.rentBikeStatus.row[j].stationId==id){
								infowindow.setContent("<div class=\"setmain\"><div class=\"ba\"><br><i class=\"fas fa-map-signs\">&nbsp</i>"
										+"<t class=\"nn\">"+name+"</t><br><br><i class=\"fas fa-bicycle\">&nbsp</i>"
										+"대여가능 대수 : "+cnt+" 대<br><br><i class=\"far fa-clock\">&nbsp</i> 조회 시간 : "+time+"<br>"
										+"<div><a href='${path}/info/station_info.bike?number="+number+"'><br><input class=\"bt1\" type='button' value='상세정보'></a><br></div></div>");
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
	var marker_on_off=new Array();
	

	</script>

</div><!-- map_div 닫음 -->

<c:forEach items="${stationList }" var="station">
		<script type="text/javascript">
			var content = {
					content: '<div>${station.name}</div>',
					content_split: "${station.name}",
					id: "${station.station_id}",
					number: "${station.number}",
					latitude: "${station.latitude}",
					longitude: "${station.longitude}",
					address:"${station.address}"
			}
			positions.push(content);
		</script>
</c:forEach>

<!-- 비로그인시 로그인창 표시 , 로그인시 즐겨찾기 정보가 표시 -->
<div id="login_div">
 
	<div id="con2_title">
		즐겨찾는 대여소
	</div>
	
<c:if test="${sessionScope.member==null}">	
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

 </c:if>	<!-- sessionScope.member==null 닫음 -->
 
 <c:if test="${sessionScope.member!=null}">	
 <div id="bm_hello">${sessionScope.member.name }님 환영합니다</div>

<!-- 회원 즐겨찾기 목록 출력 -->
<c:forEach var="num" begin="0" end="2" step="1" varStatus="status">
	<c:choose>
		<c:when test="${!empty bookmark[num]}">
			<div class="bm_list" onmouseover="this.style.borderColor='#0E7518';this.style.borderStyle = 'solid';" 
									onmouseout="this.style.borderColor='#8fb49c';this.style.borderStyle = 'dashed';"
									onclick="location.href='${path}/info/station_info.bike?number=${bookmark[num].number}'">
		 		<div class="bm_L">
		 			<div class="bm_number">${bookmark[num].number}.</div>
		 			<div class="bm_name">${bookmark[num].name}</div>
		 		</div>
		 		
		 		<div class="bm_R">
		 			<div class="bm_R_title">대여가능 자전거</div>
		 			<div class="bm_rest ${status.count}"></div>
		 			
		 			<script>
		 			
		 			$.ajax({
			    		url: "http://openapi.seoul.go.kr:8088/744c44676964646f3832527170746b/json/bikeList/${bookmark[num].call_no-8}/${bookmark[num].call_no+8}",
			    		dataType: "json",
			    		type: "GET",
				        async: "false",
						success: function(data){
							for(var i=0;i<data.rentBikeStatus.row.length;i++){
								if(data.rentBikeStatus.row[i].stationId=='${bookmark[num].station_id}'){
									$(".${status.count}").html(data.rentBikeStatus.row[i].parkingBikeTotCnt);
								}
							}
						}
					})
		 			
		 			</script>
		 		</div>
	 		</div>
		</c:when>
		<c:otherwise>
			<div class="bm_list" style="padding: 0px;cursor: default;">
				<div class="bm_none">대여소 즐겨찾기 등록 가능</div>
			</div>
		</c:otherwise>
	</c:choose>
</c:forEach> 

 </c:if><!-- !sessionScope.member==null 닫음 -->
 
 
</div><!-- login_div 닫음 -->

<div id="notice_list">
	<div id="notice_title">
		Notice <span style="color:gray; font-size: 12px;font-weight: 600;">- 공지사항</span>
		<a href="${path}/board/notice.bike" id="notice_click">more</a>
	</div>
	<!-- SQL이랑 JSTL 이용해서 만들것 -->
	<div id="notices">
		<c:forEach items="${noticelist }" var ="notice">
			<div class="notice_line">
				<div class="notice_title">&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;<a href="board/notice_detail.bike?num=${notice.board_no }">${notice.title }</a></div>
				<div class="notice_date"><fmt:formatDate value="${notice.regdate }" pattern="yyyy-MM-dd"/></div>
			</div>
    	</c:forEach>
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
	</div>
</div>
<div id="asd"></div>
</div><!-- container 닫음 -->
</div><!-- wrap 닫음 -->
</body>
</html>
