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
	font-size: 16px;
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
  	width: 70px;
  	height: 30px;
  	background-color: #4CAF50;
}
#list:hover{
	background-color: #0E7518;
}
.top{
	width: 1020px;
	height: 55px;
}

.btn-group .button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: right;
  margin-top: 10px;
}
.btn-group .button:hover {
  background-color: #0E7518;
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
	<br>
	<div class="top">
		<div style="float: left">
			<h3>${b.number }.${station.name } ♡(즐찾여부)</h3>
			<p>${station.address }</p>
		</div>
		<c:if test="${member.name == b.user_name}">
			<div class="btn-group">
			 	 <button class="button" onclick="location.href='delete.bike?num=${b.board_no}'">삭제</button>
			 	 <button class="button" onclick="location.href='update.bike?num=${b.board_no}'">수정</button>
			</div>
		</c:if>
	</div>
	<div id="get_board">
		<c:if test="${b.type == 1}">잡담.</c:if>
		<c:if test="${b.type == 2}">정보.</c:if>
		<c:if test="${b.type == 3}">질문.</c:if>
		&nbsp;&nbsp; ${b.title}<br>
		작성자. ${b.user_name}&nbsp;&nbsp;&nbsp;
		<fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
	</div>
	<br>
	
	<div id="content">${b.content }</div>
	
	<div id="list"><a href="list.bike" style="color: white;">목록</a></div>
	<br><br><br>
</div>
</body>
</html>