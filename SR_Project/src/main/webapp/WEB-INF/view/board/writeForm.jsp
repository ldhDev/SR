<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 작성</title>
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
#writeFrom{
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

<div id="writeFrom">
<form:form modelAttribute="board" action="write.bike" name="f">
	<form:hidden path="number"/>
	<form:hidden path="user_id"/>
	<form:hidden path="user_name"/>
	<div class="line">
		<div class="tag">제목</div><div><form:input path="title" size="100px;"/></div>
	</div>
	<div class="line">
		<div class="tag">타입</div>
		<div style="display: inline;">
			<form:select path="type">
				<option value="1">잡담</option>
				<option value="2">정보</option>
				<option value="3">질문</option>
			</form:select>
		</div>
	</div>
	<div class="line">
		<div class="tag">내용입력</div>
		<div style="display: inline;"><form:textarea path="content" rows="15" cols="101"/></div>
	</div>
	<div class="btn-group">
	 	<button class="button" style="margin-left: 43%" onclick="javascript:document.f.submit()">작성</button>
	</div>
</form:form>
	<div class="btn-group">
		<button class="button" onclick="javascript:history.go(-1)">취소</button>
	</div>
</div>

</body>
</html>