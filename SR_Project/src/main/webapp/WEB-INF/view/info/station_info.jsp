<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body{
	/*�ȵŸ� �����Ұ�*/
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
<title>SR �뿩�� ������ �ȳ�</title>
</head>
<body><div id="wrap">

<div id="map_div">
	<div id="map_search">
		<select style="height: 45px;width: 200px; box-sizing: border-box;float: left;">
			<option>�뿩�� �̸�</option>
			<option>�뿩�� ��ȣ</option>
		</select>
		<input type="text" name="find" style="height: 45px;width: 820px; box-sizing: border-box; padding-left:10px; float: left;">
	</div>

	<div id="map"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f692a5cbdd7deb058db63ec9f3045a3"></script>
	<script>
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.477885, 126.878985), // ������ �߽���ǥ (�п�)
	        level: 4 // ������ Ȯ�� ����
	    };
	
	// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
	var map = new daum.maps.Map(mapContainer, mapOption); 
	
	//��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 

	
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
	
	window.onload = function() {
		for (var i = 0; i < positions.length; i ++) {
		    // ��Ŀ�� �����մϴ�
		    var marker = new daum.maps.Marker({
		        map: map, // ��Ŀ�� ǥ���� ����
		        position: positions[i].latlng // ��Ŀ�� ��ġ
		    });
		
		    // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
		    var infowindow = new daum.maps.InfoWindow({
		        content: positions[i].content // ���������쿡 ǥ���� ����
		    });
		
		    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
		    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
		    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
		    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
	};
	
	</script>

</div><!-- map_div ���� -->

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
	<div id="station_name">1834. ���� �޸���� ��ó���� 2�� �� (��ã����)</div>
	<div id="station_etc">�ּ��ּ��ּ��ּ��ּ��ּ��ּ�  <span>��ȸ�ð� 2018.12.12 15:11:11</span></div>

</div><!-- station_title ���� -->


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
	</div><!-- info_L ���� -->
	
	<div style="height:190px; width:1px; background-color:#d6d6d6; float: left; margin-top: 35px;"></div>
	
	<div id="info_R">
		<div id="chart_title">
			�뿩�� �̿� �������
		</div>
	</div><!-- info_R ���� -->
</div>

<div id="comment_title">
	�뿩�� ������ �� ��
</div>

</div></body>
</html>