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


/* ���� Ŭ�� �� ������ ȭ�� css */
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


	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = { 
			center: new daum.maps.LatLng(${!empty info.latitude?info.latitude:37.477885}, ${!empty info.longitude?info.longitude:126.878985}),  // ������ �߽���ǥ (�п�)
	        level: 4 // ������ Ȯ�� ���� 
	    };
	
	// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
		var map = new daum.maps.Map(mapContainer, mapOption); 
		map.setMinLevel(3);
		map.setMaxLevel(5);

	
	//���� 0114 (2)
	
	
		window.onload = function() {
		
		
		//���� ����

		for (var i = 0; i < positions.length; i++) {
			// ��Ŀ�� �����մϴ�
			
				//���� 01/14
	
	
	var imageSrc = 'https://cdn.icon-icons.com/icons2/677/PNG/512/bicycle_icon-icons.com_60878.png', // ��Ŀ�̹����� �ּ��Դϴ�    
    imageSize = new daum.maps.Size(45, 45), // ��Ŀ�̹����� ũ���Դϴ�
    imageOption = {offset: new daum.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
      
// ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption),
    markerPosition = new daum.maps.LatLng(positions[i].latitude, positions[i].longitude); // ��Ŀ�� ǥ�õ� ��ġ�Դϴ�
    


// ��Ŀ�� �����մϴ�
var marker = new daum.maps.Marker({
    position: markerPosition, 
    image: markerImage // ��Ŀ�̹��� ���� 
});
var infowindow = new daum.maps.InfoWindow({
	content : positions[i].content
// ���������쿡 ǥ���� ����
});
var id = positions[i].id
var name = positions[i].name
var number = positions[i].number
var my_name=positions[i].content_split

var infowindow2 = new daum.maps.InfoWindow({
	content : "��ȸ���Դϴ�.", // ���������쿡 ǥ���� ����
	removable : true
});

var marker_target_info= {
		marker_target: marker,
		address: positions[i].address,
		name: my_name,
		number: number
}
marker_on_off.push(marker_target_info);
// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
marker.setMap(map);  
	
	
	//���� �Ϸ� 


				// ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
				// �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
				// for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
				
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
			if(menu_such=="�뿩�� �̸�"){
				for(var i=0;i<marker_on_off.length;i++){
					if(find_value==null||find_value==""){break;}
					var marker_such=marker_on_off[i].marker_target;
					var address_such=marker_on_off[i].name;
					if(address_such.includes(find_value)){// ���� �� ���ڿ��� ���Եȴٸ� true
						marker_such.setMap(map); // ������ �ø���.
						if(such_zero){
							map.setCenter(marker_such.getPosition());
						}
						such_zero=false;
					}else{// ���ڿ��� ������ �ȵȴٸ� false
						marker_such.setMap(null); // �������� �����Ѵ�.
					}
				}	
			}else if(menu_such=="�뿩�� �ּ�"){
				for(var i=0;i<marker_on_off.length;i++){
					if(find_value==null||find_value==""){break;}
					var marker_such=marker_on_off[i].marker_target;
					var address_such=marker_on_off[i].address;
					if(address_such.includes(find_value)){// ���� �� ���ڿ��� ���Եȴٸ� true
						marker_such.setMap(map); // ������ �ø���.
						if(such_zero){
							map.setCenter(marker_such.getPosition());
						}
						such_zero=false;
					}else{// ���ڿ��� ������ �ȵȴٸ� false
						marker_such.setMap(null); // �������� �����Ѵ�.
					}
				}	
			}
			
			if(such_zero){
				alert("��ȸ ������ �����ϴ�.");
				for(var i=0;i<marker_on_off.length;i++){
					var marker_such=marker_on_off[i].marker_target;
					marker_such.setMap(map);
					$("#find").val("");
				}
			}
		})
		};
	
	
	//��
	
	//��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 

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
									+"�뿩���� ��� : "+cnt+" ��<br><br><i class=\"far fa-clock\">&nbsp</i> ��ȸ �ð� : "+time+"<br>"
									+"<div><br><input class=\"bt1\" type='button' value='������' onClick='move("+number+")'><br></div></div>");
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
										+"�뿩���� ��� : "+cnt+" ��<br><br><i class=\"far fa-clock\">&nbsp</i> ��ȸ �ð� : "+time+"<br>"
										+"<div><br><input class=\"bt1\" type='button' value='������' onClick='move("+number+")'><br></div></div>");
								sos=false;
								
							}
						}
					}
				})
			}
	        infowindow.open(map, marker);
	    };
	}
	
	// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
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