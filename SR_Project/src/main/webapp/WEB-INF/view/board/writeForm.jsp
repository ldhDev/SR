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
	width: 1020px;
	padding: 20px; 
}
.title{
	width: 150px;
	display: inline-block;
	text-align: center;
}
.type{
	width: 150px;
	display: inline-block;
	text-align: center;
}
.content{
	width: 150px;
	height:-10px;
	display: inline-block;
	text-align: center;
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
	<!--글쓴이  -->
	<%-- <input type="hidden" name="name" value="${login.id }"> --%>
	
	<div class="title">제목</div><div style="display: inline;"><form:input path="title"/></div>
	<br>
	<div class="type">타입</div>
	<div style="display: inline;">
		<select name="type" id="type">
			<option value="">선택하세요</option>
			<option value="1">잡담</option>
			<option value="2">정보</option>
			<option value="3">질문</option>
		</select>
	</div>
	<br>
	<div class="content">내용입력</div>
	<div style="display: inline;"><form:textarea path="content" rows="15" cols="80"/></div>
	<input type="submit" value="글쓰기">
</form:form>

</div>

</body>
</html>