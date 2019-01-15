<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style type="text/css">
body{ 
	/*�ȵǸ� �����Ұ�*/
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
	cursor: pointer;
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
	margin-right: 5px;
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
	position:relative;
	height: 200px;
	width: 960px;
	border: 1px solid #d6d6d6;
	box-sizing: border-box;
}
#need_login{
	position:absolute;
	height: 200px;
	width: 960px;
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
	cursor: pointer;
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
	line-height:39px;
	width: 80px;
	color: white;
	font-size:16px;
	font-weight:700;
	font-family: "Nanum Gothic";
	float: right;
	text-align:center;
	cursor : pointer; 
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
.list_panel:last-child{
	border-bottom: 0px;
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
	font-family: "����";
	color:gray;
}

.page{
	background-color:gray;
	width:960px;
	height: 50px;
	line-height: 50px;
	margin-bottom: 50px;
	text-align: center;
}

#not_exist{
	width: 880px;
	height: 280px;
	line-height:280px;
	font-weight:700;
	font-size:20px;
	font-family: "Nanum Gothic";
	border-top: 5px solid #85d179;
	border-bottom: 5px solid #85d179;
	text-align: center;
	margin-bottom: 40px;
}

#comment_not_exist{
	width:780px;
	height:180px;
	line-height:160px;
	text-align:center;
	font-weight:700;
	font-size:16px;
	color:gray;
	font-family: "Nanum Gothic";
	border-bottom:2px solid #85d179;
	margin-bottom: 45px;
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
<script type="text/javascript">
$(document).ready(function(){ 
		
		var apiURI = "http://api.openweathermap.org/data/2.5/weather?lat=${!empty info.latitude?info.latitude:37.477885}&lon=${!empty info.longitude?info.longitude:126.878985}&appid=c0ebe0d171c3c649371ea1781fb397ce";

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
	
	$.ajax({
	    		url: "http://openapi.seoul.go.kr:8088/744c44676964646f3832527170746b/json/bikeList/${info.call_no-8}/${info.call_no+8}",
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

function hover_star(num){
	var star = ""
	for(i=1;i<=5;i++){
			star = "#star"+i;
			$(star).css('color', 'gray');
		}
	
	for(i=1;i<=num;i++){
		star = "#star"+i;
		$(star).css('color', '#189d0e');
	}
	
}

function out_star(){
	var num = $('#choice_star').val();
	for(i=1;i<=5;i++){
		star = "#star"+i;
		$(star).css('color', 'gray');
	}

	for(i=1;i<=num;i++){
	star = "#star"+i;
	$(star).css('color', '#189d0e');
	}
}

function select_star(num){
	$('#choice_star').val(num);
	$('#sel_star').html(num);
}

var ck_byte = 0;
////////������ ���ڼ� ����
function byte_ck(obj) {
    var maxByte = 200; //�ִ� �Է� ����Ʈ ��
    var str = obj.value;
    var str_len = str.length;
 
    var input_byte = 0;
    var one_char = "";
 
    for (var i = 0; i < str_len; i++) {
        one_char = str.charAt(i);
 
        if (escape(one_char).length > 4) {
        	input_byte += 2; //�ѱ�2Byte
        } else {
        	input_byte++; //���� �� ������ 1Byte
        }
    }
 
    if (input_byte > maxByte) {
        $("#limit").html(input_byte);
        $("#limit").css('color', 'red');
        ck_byte = input_byte;
    } else {
        $("#limit").html(input_byte);
        $("#limit").css('color', 'gray');
        ck_byte = input_byte;
    }
}


////// ������ �Է�
function comment_submit(){
	if($('#choice_star').val() == 0){
		alert("������ �������ּ���");
		return false;
	}
	if(ck_byte == 0){
		alert("������ �Է����ּ���");
		return false;
	}
	if(ck_byte > 200){
		alert("������ 200byte�� �ѱ� �� �����ϴ�.")
		return false;
	}
	
	document.comment_form.submit();
	
}


//��α��� ����ڰ� ���ã�� Ŭ��
function need_login(){
	if(confirm("�α����� �ʿ��� �����Դϴ�, �α��� �Ͻðڽ��ϱ�?")){
		<%
		    String clientId = "SXBfAVH8cGbb5AJWQWbQ";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
		    String redirectURI = URLEncoder.encode("http://localhost:8080/SR_Project/main2.bike", "UTF-8");
		    SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		    session.setAttribute("state", state);
	 	%>

	 	location.href = "<%=apiURL%>";
		
	}
	
}

//���ã�� ����

//���ã�� ���
function bookmark_in(s_num){
	
	if(${bookmark_limit}==1){
		alert("���ã��� �ִ� 3������ �����մϴ�.");
	} 
	else{
		$.ajax({ 
			url : "bookmark_in.bike",
			type : "POST",
			data : {			
				number:s_num
				},		
			success : function(data){
				$("#heart").html('<span onclick="bookmark_out('+s_num+')">��</span>');
				$("#bookmark").html(data);
			},
			error : function(error) {
				alert("������ �߻��߽��ϴ�.");
		    }

		})
	}

}

//���ã�� ����
function bookmark_out(s_num){

		$.ajax({ 
			url : "bookmark_out.bike",
			type : "POST",
			data : {			
				number:s_num
				},		
			success : function(data){
				$("#heart").html('<span onclick="bookmark_in('+s_num+')">��</span>');
				$("#bookmark").html(data);
			},
			error : function(error) {
				alert("������ �߻��߽��ϴ�.");
		    }

		})

}



</script>

<meta charset="EUC-KR">
<title>SR �뿩�� ������ �ȳ�</title>
</head>
<body><div id="wrap">
  
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
									+"<div><a href='${path}/info/station_info.bike?number="+number+"'><br><input class=\"bt1\" type='button' value='������'></a><br></div></div>");
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
										+"<div><a href='${path}/info/station_info.bike?number="+number+"'><br><input class=\"bt1\" type='button' value='������'></a><br></div></div>");
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

</div><!-- map_div ���� -->

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

</div><!-- map_div ���� -->

<c:forEach items="${stationList }" var="station">
		<script type="text/javascript">
			var content = {
					content: '<div>${station.name}</div>', 
			        latlng: new daum.maps.LatLng("${station.latitude}", "${station.longitude}"),
					id: "${station.station_id}",
					number: "${station.number}"
			}
			positions.push(content);
		</script>
</c:forEach>


<!-- �뿩�� ���� �ְ� ������ ���� -->
<c:if test="${info_open == 1 }">

<div id="station_title"> 
	<div id="station_name">
		${info.number} . ${info.name}&nbsp;&nbsp;
		<c:if test="${empty sessionScope.member }"><span id="heart" onclick="need_login()">��</span></c:if>
		<c:if test="${!empty sessionScope.member }">
			<c:if test="${!empty bookmark }"><span id="heart"><span onclick="bookmark_out(${info.number})">��</span></span></c:if>
			<c:if test="${empty bookmark }"><span id="heart"><span onclick="bookmark_in(${info.number})">��</span></span></c:if>
		</c:if>
		<span id="bookmark">(${count})</span>
	</div>
	<div id="station_etc">${info.address}  <span>��ȸ�ð� <fmt:formatDate value="${info_time}" pattern="yyyy.MM.dd HH:mm:ss"/></span></div>

</div><!-- station_title ���� -->

<div id="station_info">
	<div id="info_L">
		<div id="rest_bike">
			<div id="rest_title">�뿩���� ������</div>
			<div id="rest_cnt"><span id="rest"> </span> / ${info.rack_totCnt}</div>
		</div>
			<div class="line_vertical" style="margin-top: 25px;"></div>
		<div id="score">
			<div id="score_title">�뿩�� ����</div>
			<div id="score_star">
				<% String star = ""; %>
				<c:forEach begin="1" end="5" var="i">
					<c:choose>
						<c:when test="${station_score >= i }"><% star = star+"��"; %></c:when>
						<c:otherwise><% star = star+"��"; %></c:otherwise>
					</c:choose>
				</c:forEach>
				<%=star %>
				<span style="font-size: 20px;">${!empty station_score?station_score!=0.0?station_score:0:0}<span style="font-size: 22px;">/</span>5</span>
			</div>
			<div id="score_cnt">( ${comment_cnt } )</div>
		</div>
			<div class="line_hor"></div>
		<div id="board">
			<div id="board_icon">
				<a href="${path }/board/list.bike?num='${param.number}'"><img src="${path }/img/board_icon.png"></a>
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
<!-- ��α��� ����ڰ� Ŭ�� �� -->
<c:if test="${sessionScope.member==null}">
	<div id="need_login" onclick="need_login()"></div>
</c:if>

	<div id="comment_star">
		<span class="stars" onmouseleave="out_star()">
			<span id="star1" onmouseover="hover_star(1)" onclick="select_star(1)">��</span>
			<span id="star2" onmouseover="hover_star(2)" onclick="select_star(2)">��</span>
			<span id="star3" onmouseover="hover_star(3)" onclick="select_star(3)">��</span>
			<span id="star4" onmouseover="hover_star(4)" onclick="select_star(4)">��</span>
			<span id="star5" onmouseover="hover_star(5)" onclick="select_star(5)">��</span>
		</span> 
		<span id="sel_star">0</span> / 5&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;font-family: '����';color:gray;font-weight:normal;">- �� �뿩�Ҵ� �����?</span>
	</div><!-- comment_star ����  -->
	
<form action="" name="comment_form">

	<input type="hidden" name="choice_star" id="choice_star" value="0">
	<input type="hidden" name="number" value="${info.number }">
	<input type="hidden" name="user_id" value="${sessionScope.member.user_id }">
	
		<div id="write">
			<textarea name="content" id="content" placeholder="������ �Է����ּ���" onkeyup="byte_ck(this)"></textarea>
		</div><!-- write ����  -->
		<div id="submit_line">
			<span id="limit">0</span> / 200 byte
			<div id="sub_btn" onclick="comment_submit()">���</div>
		</div><!-- submit_line ����  -->
	
</form><!-- form ��  -->

</div><!-- comment ����  -->

<div id="comment_line"></div>

<c:if test="${!empty comment }">
<div id="comment_list">

<c:forEach var="c_list" items="${comment }">
	<div class="list_panel">
			<div class="user_star">
				<c:forEach var="num" begin="1" end="5" step="1"><c:choose><c:when test="${num <= c_list.score }">��</c:when><c:otherwise>��</c:otherwise></c:choose></c:forEach> <span>&nbsp;${c_list.score }</span>
			</div>
			<div class="user_comment">
				${c_list.comment }
			</div>
			<div class="comment_info">
				${c_list.user_name }  |  <fmt:formatDate value="${c_list.regdate }" pattern="yyyy-MM-dd"/>
			</div>
	</div>
</c:forEach>

</div><!-- comment_list �� -->

<div class="page">
			<c:if test="${pageNum > 1}"><a href="javascript:list(${pageNum -1 })">[����]</a></c:if>
			<c:if test="${pageNum <= 1 }">[����]</c:if>
			<c:forEach var="a" begin="${startpage }" end="${endpage }">
				<c:if test="${a==pageNum }">[${a }]</c:if>
				<c:if test="${a!=pageNum }"><a href="javascript:list(${a })">[${a }]</a></c:if>
			</c:forEach>
			<c:if test="${pageNum < maxpage}"><a href="javascript:list(${pageNum +1 })">[����]</a></c:if>
			<c:if test="${pageNum >= maxpage }">[����]</c:if>
</div>

</c:if><!-- ${!empty comment } �� �� -->

<c:if test="${empty comment }">
	<div id="comment_not_exist">
	���� ��ϵ� �뿩�� �Ѹ��� �����ϴ�, ���� ���� �뿩�� �Ѹ��� ���ܺ�����!
	</div>
</c:if><!-- ${empty comment } �� �� -->



</c:if> <!-- c:if info_open == 1 �� ��  -->


<!-- �뿩�� ���� ���� ������ ���� -->
<c:if test="${info_open == 0 }">
	<div id="not_exist">
	Ȯ���Ͻ� �뿩�Ҹ� �������ּ���
	</div>
</c:if><!-- c:if info_open == 1 �� ��  -->

</div></body>
</html>