<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�������� ����ȭ��</title>
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
	height: 1000px;
	background-color: navy;
}

#map_div{
	width: 600px;
	height: 550px;
	box-sizing:border-box;
	float: left;
}
#map_search{
	width: 600px;
	height: 50px;
	font-family: "Roboto", sans-serif;
}
#map{
	width: 600px;
	height: 500px;
}

#login_div{
	padding-top:30px;
	width: 420px;
	height: 550px;
	float: left;
	background-color: #BDEDC9;
	box-sizing: border-box;
}
#con2_title{
	margin-right:90px;
	width: 300px;
	height: 65px;
	line-height: 65px;
	font-size:26px;
	font-weight:800;
	font-family: "Nanum Gothic";
	border-bottom: 5px solid #0E7518;
}
</style>

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
		<select style="height: 50px;width: 180px; box-sizing: border-box;float: left;">
			<option>�뿩�� �̸�</option>
			<option>�뿩�� ��ȣ</option>
		</select>
		<input type="text" name="find" style="height: 50px;width: 420px; box-sizing: border-box; padding-left:10px; float: left;">
	</div>

	<div id="map"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f692a5cbdd7deb058db63ec9f3045a3"></script>
	<script>
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.477885, 126.878985), // ������ �߽���ǥ
	        level: 3 // ������ Ȯ�� ����
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

<!-- ��α��ν� �α���â ǥ�� , �α��ν� ���ã�� ������ ǥ�� -->
<div id="login_div">
	<div id="con2_title">
		�α���
		<c:forEach items="${stationList }" var="station">
		<script type="text/javascript">
			var content = {
					content: '<div>${station.name}</div>', 
			        latlng: new daum.maps.LatLng("${station.latitude}", "${station.longtitude}")
			}
			positions.push(content);
		</script>
		</c:forEach>
	</div>
	
	<input type="text" name="id" class="login_input" placeholder="ID�� �Է����ּ���">
</div><!-- login_div ���� -->

</div><!-- container ���� -->
</div><!-- wrap ���� -->
</body>
</html>
