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
	font-family: "����";
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
	font-family: "����";
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
	lat = null;	//�� �޾ƿð� �޴�Ŭ���ÿ��� ���ο��� �ִ� ��ġ������ , �� ��ũ�� ������ �������� 
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
	        	$("#w_temp").html(Math.floor((resp.main.temp- 273.15))+"��" );
	            var imgURL = "http://openweathermap.org/img/w/" + resp.weather[0].icon + ".png";
	            $("#w_img").html("<img src='"+imgURL+"' style='height:80px;width:80px;'>");	            
	        } //������
	    })//�����轺
	//////////////////////////////////////////////////////////AJAX

});
</script>

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
	<div id="station_name">1834. ���� �޸���� ��ó���� 2�� <span id="heart">��</span><span id="bookmark">(��ã����)</span></div>
	<div id="station_etc">�ּ��ּ��ּ��ּ��ּ��ּ��ּ�  <span>��ȸ�ð� 2018.12.12 15:11:11</span></div>

</div><!-- station_title ���� -->


<div id="station_info">
	<div id="info_L">
		<div id="rest_bike">
			<div id="rest_title">�뿩���� ������</div>
			<div id="rest_cnt"><span>5</span> / 13</div>
		</div>
			<div class="line_vertical" style="margin-top: 25px;"></div>
		<div id="score">
			<div id="score_title">�뿩�� ����</div>
			<div id="score_star">�ڡڡڡڡ� <span>4/5</span></div>
		</div>
			<div class="line_hor"></div>
		<div id="board">
			<div id="board_icon">
				<a href="${path }/main.bike"><img src="${path }/img/board_icon.png"></a>
			</div>
			<div id="board_title">�뿩�Һ� �Խ���</div>
		</div>
			<div class="line_vertical"></div>
		<div id="local_weather">
			<div id="w_wrap">
				<div id="w_img"></div>
				<div id="w_temp"></div>
			</div>
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
	�뿩�� �Ѹ��� �� ��
</div>

<div id="comment">
	<div id="comment_star">
		<span class="stars">
			<span id="star1" >��</span>
			<span id="star2" >��</span>
			<span id="star3" >��</span>
			<span id="star4" >��</span>
			<span id="star5" >��</span>
		</span> 
		<span id="sel_star">0</span> / 5&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;font-family: '����';color:gray;font-weight:normal;">- �� �뿩�Ҵ� �����?</span>
	</div><!-- comment_star ����  -->
	<div id="write">
		<textarea placeholder="������ �Է����ּ���"></textarea>
	</div><!-- write ����  -->
	<div id="submit_line">
		<span id="limit">0</span> / 200
		<div id="sub_btn">���</div>
	</div><!-- submit_line ����  -->
</div><!-- comment ����  -->

<div id="comment_line"></div>

<div class="review">������ �̷��� �ϸ� �Ű� ���� DB ���۾� ����</div>

</div></body>
</html>