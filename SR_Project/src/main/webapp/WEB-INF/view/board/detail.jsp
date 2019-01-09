<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세보기</title>
<style type="text/css">
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
#board{
	width: 1020px;
}
#get_board{
	border-bottom: 3px solid #A9F5BC;
	border-top: 3px solid #A9F5BC;
	padding: 20px;
	font-size: 20px;
	color: #2E2E2E
}
#content{
	color: #585858;
	padding-bottom: 50px;
}
#list{
	margin: 0 auto;
	text-align: center;
  	font-size: 16px;
  	padding: 4px;
  	width: 80px;
  	height: 28px;
  	background-color: #A9F5BC;
  	color: #585858;
}
</style>
</head>
<body>
<div id="main_img_bar">
	<div id="main_img">
		<img src="../img/main_img.jpg" style="height: 170px;width: 1020px;">
	</div>
</div>

<div id="board">
	<c:set value="${board}" var="b"/>
	<h3>${b.number } : 대여소 게시판 번호 게시판 이름</h3>
	<br>
	<div id="get_board">
		글타입:${b.type}&nbsp;&nbsp;제목:${b.title}<br>
		닉네임:${b.user_name}&nbsp;&nbsp;
		날자:<fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
	</div>
	<br>
	
	<div id="content">내용:${b.content }</div>
	
	<div id="list"><a href="list.bike">목록</a></div>
	<br><br><br>
</div>
</body>
</html>