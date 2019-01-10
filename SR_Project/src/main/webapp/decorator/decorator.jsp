<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<decorator:head />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700" rel="stylesheet">

<style type="text/css">
*{
	margin: 0 auto;
}
a{
	text-decoration: none;
	color: black;
}
li{
	list-style-type: none;
}
#deco_gnb_bar{
	height: 98px;
	width: 100%;
	background-color:#FFFDFD;
	border-bottom: 2px solid #81d076;
}

#deco_gnb_sub_gnb{
	height: 18px;
	line-height:18px;
	width: 1020px;
	font-size: 14px;
	color: black;
	text-align: right;
	position: relative;
}

#deco_logo{
	position: absolute;
	top: 10px;
	left: 0px;
	width: 216px;
	height: 78px;
}
#deco_gnb{
	height: 80px;
	line-height: 80px;
	width: 1020px;
	font-weight: bold;
	text-align: center;
}
#deco_gnb img{
	float: left;
}
#deco_gnb ul{
	height: 80px;
	line-height: 80px;
	width: 750px;
	font-weight: bold;
	font-size:18px;
	float: right;
}
#deco_gnb li{
	height: 80px;
	line-height: 80px;
	width: 150px;
	float:left;
	text-align: center;
	font-weight:800;
	font-family: "Nanum Gothic";
}
#deco_gnb li a{
	display:block;
}
#deco_gnb li a:hover{
	display:block;
	color: #2c9b32;
}

#deco_footer_bar{
	height: 135px;
	width: 100%;
	background-color:#f3f3f3;
}
#deco_footer{
	height: 135px;
	width: 1020px;
	font-size: 12px;
	text-align: left;
}
#deco_footer_tos{
	height: 60px;
	line-height: 60px;
	width: 1020px;
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 5px;
}

#deco_footer_desc{
	line-height: 18px;
}

</style>
</head>
<body>
<div id="deco_gnb_bar">
	<div id="deco_gnb_sub_gnb">
	<a href="${path }/main.bike"><img src="${path }/img/logo_all.png" id="deco_logo"></a>
		<c:if test="${empty sessionScope.member }">
			  <%/*
			    String clientId = "SXBfAVH8cGbb5AJWQWbQ";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
			    String redirectURI = URLEncoder.encode("http://localhost:8080/SR_Project/main2.bike", "UTF-8");
			    SecureRandom random = new SecureRandom();
			    String state = new BigInteger(130, random).toString();
			    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
			    apiURL += "&client_id=" + clientId;
			    apiURL += "&redirect_uri=" + redirectURI;
			    apiURL += "&state=" + state;
			    session.setAttribute("state", state);
			    < % = apiURL % >    
			    
			    //�������� , ����Ʈ�޽ÿ��� �����ϸ� ���ΰ��� ����
			    */
			 %>
			<a href="">�α���</a>
		</c:if>
		<c:if test="${!empty sessionScope.member }">
			${sessionScope.member.name }�� �ȳ��ϼ���! &nbsp;&nbsp;
			<a href="${path }/logout.bike">�α׾ƿ�</a>
		</c:if>
	</div>
	<div id="deco_gnb">
		<ul>
			<li><a href="#">�Ұ�</a></li>
			<li><a href="${path }/info/station_info.bike">�뿩�� ����</a></li>
			<li><a href="${path }/board/list.bike">Ŀ�´�Ƽ �Խ���</a></li>
			<li><a href="#">���� ������</a></li>
			<li><a href="#">��������</a></li>
		</ul>
	</div>
</div>

<decorator:body />

<div id="deco_footer_bar">
	<div id="deco_footer">
		<div id="deco_footer_tos">�̿���&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;��������ó����ħ</div>
		<div id="deco_footer_desc">
			��ȣ�� : Seoul Rider&nbsp;&nbsp;�ּ� : 08505 ����� ��õ�� ���������2�� 115, 509ȣ, 811ȣ(���굿, �븢��ũ��Ÿ��3��)
			&nbsp;&nbsp;��ȭ : 02-2108-5900&nbsp;&nbsp;�ѽ� : 02-2108-5999<br>
			������Ʈ ���� : �̵���,�ֿ���,������,�̻��&nbsp;&nbsp;����ڵ�Ϲ�ȣ : 457-85-00300&nbsp;&nbsp;��������å���� : �ֽ��� / jsj@goodee.co.kr&nbsp;&nbsp;��ǥ�� : �̽¿�
		</div>
		
	</div>
</div>

</body>
</html>