<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 수정</title>
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
#board1{
	width: 900px;
	padding: 70px; 
	padding-top: 40px;
}

.line{
	margin-bottom: 15px;
}
.tag{
	width : 80px;
	float: left;
}

.btn-group .button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  cursor: pointer;
  float: left;
  
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

<div id="board1">
	<form:form modelAttribute="board" action="notice_update.bike" name="f">
		<form:hidden path="board_no"/>
		<form:hidden path="number"/>
		<form:hidden path="type"/>
		<div class="line">
			<div class="tag">제목</div><div><form:input path="title" size="100px;"/></div>
		</div>
		<div class="line">
			<div class="tag">내용</div>
			<div style="display:inline;"><form:textarea cols="100" rows="15" path="content"/></div>
		</div>
		<div class="btn-group">
		 	<button class="button" style="margin-left: 45%" onclick="javascript:document.f.submit()">확인</button>
		</div>
	</form:form>
	<div class="btn-group">
		<button class="button" onclick="javascript:history.go(-1)">취소</button>
	</div>
</div>
</body>
</html>