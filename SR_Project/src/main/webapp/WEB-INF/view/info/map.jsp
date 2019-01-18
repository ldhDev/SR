<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	margin: 0 auto;
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


/* 지도 클릭 시 나오는 화면 css */
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




</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script type="text/javascript">
function move(number){
	top.location.href="${path}/info/station_info.bike?number="+number;
}

</script>
</head>
<body>

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
		map.setMinLevel(3);
		map.setMaxLevel(5);

	
	//수정 0114 (2)
	
	
		window.onload = function() {
		
		
		//수정 시작

		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			
				//수정 01/14
	
	
	var imageSrc = 'https://cdn.icon-icons.com/icons2/677/PNG/512/bicycle_icon-icons.com_60878.png', // 마커이미지의 주소입니다    
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
var infowindow = new daum.maps.InfoWindow({
	content : positions[i].content
// 인포윈도우에 표시할 내용
});
var id = positions[i].id
var name = positions[i].name
var number = positions[i].number
var my_name=positions[i].content_split

var infowindow2 = new daum.maps.InfoWindow({
	content : "조회중입니다.", // 인포윈도우에 표시할 내용
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
									+"<div><br><input class=\"bt1\" type='button' value='상세정보' onClick='move("+number+")'><br></div></div>");
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
										+"<div><br><input class=\"bt1\" type='button' value='상세정보' onClick='move("+number+")'><br></div></div>");
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

</div>

<c:forEach items="${stationList }" var="station">
		<script type="text/javascript">
			var content = {
					content: '<div>${station.name}</div>',
					content_split: "${station.name}",
			        //latlng: new daum.maps.LatLng("${station.latitude}", "${station.longitude}"),
					id: "${station.station_id}",
					number: "${station.number}", 
					latitude: "${station.latitude}",
					longitude: "${station.longitude}",
					address:"${station.address}" 
			}
			positions.push(content);
		</script>
</c:forEach>
</body>
</html>