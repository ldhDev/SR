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
	font-weight:bold;
	font-family: "Nanum Gothic";
}


#deco_footer_bar{
	height: 135px;
	width: 100%;
	background-color:#f3f3f3;
}
#deco_footer{
	height: 135px;
	line-height: 135px;
	width: 1020px;
	font-size: 28px;
	text-align: center;
}

</style>
</head>
<body>
<div id="deco_gnb_bar">
	<div id="deco_gnb_sub_gnb">
		<c:if test="${empty sessionScope.loginUser }">
			<a href="${path }/user/loginForm.bike">로그인</a>
		</c:if>
		<c:if test="${!empty sessionScope.loginUser }">
			${sessionScope.loginUser.userName }님
			<a href="${path }/user/logout.bike">로그아웃</a>
		</c:if>
	</div>
	<div id="deco_gnb">
		<a href="${path }/model2/index.jsp"><img src="${path }/img/logo.png" id="deco_logo" style="height: 80px;width: 100px;"></a>
		<ul>
			<li>소개</li>
			<li>대여소 정보</li>
			<li>커뮤니티 게시판</li>
			<li>마이 페이지</li>
			<li>공지사항</li>
		</ul>
	</div>
</div>

<decorator:body />


<div id="deco_footer_bar">
	<div id="deco_footer">
		푸터 영역
	</div>
</div>

</body>
</html>