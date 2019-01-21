<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>my page</title>
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
	padding: 40px;
	padding-bottom: 400px;
	padding-left: 80px;
	padding-right: 80px;
	
}
.info{
	margin: 10px;
}
p{
	margin: 5px;
	font-size: large;
	padding-top: 15px;
}
.value{
	border-bottom: 2px solid #1a9c17;
	color: #848484;
	font-size: large;
	width: 80%;
	height: 30px;
	padding-top: 5px;
}
input[type=text]{
	border: none;
	border-bottom: 2px solid #1a9c17;
	color: #848484;
	font-size: large;
	width: 80%;
	height: 30px;
}
#up{
  	font-size: 16px;
  	padding: 4px;
  	background-color: #1a9c17;
}
#up:hover{
	background-color: #0E7518;
}
.bookmark p{
	padding: 5px;
}
.bookmark .up{
	margin-top: 50px;
	padding: 5px;
}
</style>
</head>
<body>
<div id="main_img_bar">
	<div id="main_img">
		<img src="../img/mypage/mypage.jpg" style="height: 170px;width: 1020px;">
	</div>
</div>
<div id="board">
	<div style="width: 400px; float: left; padding-bottom: 100px; margin-left: 25px; padding-left: 70px;">
		<div class="info">
			<h3>������</h3>
			<p>�г���</p> 
			<form:form modelAttribute="member" name="f" action="update.bike">
				<form:input path="name"/>
				<a href="javascript:document.f.submit()" id="up" style="color: white;">����</a>
			</form:form>
		</div>
		<div class="info">	
		
			<p>����</p>
			<c:if test="${member.gender == 'M'}">
				<p class="value">����</p>
			</c:if>
			<c:if test="${member.gender != 'M'}">
				<p class="value">����</p>
			</c:if>    
		</div>
		<div class="info">	
			<p>����</p>  
			<p class="value">${member.age }��</p>
		</div>
		<div class="info">	
			<p>�̸���</p> 
			<p class="value">${member.email }</p> 
		</div>
		
		<div style="padding-left: 150px; padding-top: 15px;"><a id="up" href="delete.bike" style="color: white;">Ż��</a></div>
		
	</div>
	<div class="bookmark" style="width: 500px; margin-left:480px; padding-top: 10px;">
		<h3>���ã��</h3>
		<div style="margin-top: 15px; height: 50px; padding-bottom: 30px;" >
			<div style="float: left; width: 110px;">
				<p>���ã��1.</p>
			</div>
			<c:if test="${member.bookmark1 == 0}">
				<div style="line-height: 34px;"><p>����</p></div>
			</c:if>
			<c:if test="${member.bookmark1 != 0}">
				<div style="float: left; width:270px; white-space:normal;"><p>${station1.name}</p></div><div style="width:70px; line-height:44px; float: right;"><a id="up" href="bookmark_delete.bike?number=${station1.number }" style="color: white;">����</a></div>
			</c:if>
		</div>
		<div style="height: 50px; padding-bottom: 30px;" >
			<div style="float: left; width: 110px;">
				<p>���ã��2.</p>
			</div>
			<c:if test="${member.bookmark2 == 0}">
				<div style="line-height: 34px;"><p>����</p></div>
			</c:if>
			<c:if test="${member.bookmark2 != 0}">
				<div style="float: left; width:270px; white-space:normal;"><p>${station2.name}</p></div><div style="width:70px; line-height:44px; float: right;"><a id="up" href="bookmark_delete.bike?number=${station2.number }" style="color: white;">����</a></div>
			</c:if>
		</div>
		<div style="height: 50px; padding-bottom: 30px;" >
			<div style="float: left; width: 110px;">
				<p>���ã��3.</p>
			</div>
			<c:if test="${member.bookmark3 == 0}">
				<div style="line-height: 34px;"><p>����</p></div>
			</c:if>
			<c:if test="${member.bookmark3 != 0}">
				<div style="float: left; width:270px; white-space:normal;"><p>${station3.name}</p></div><div style="width:70px; line-height:44px; float: right;"><a id="up" href="bookmark_delete.bike?number=${station3.number }" style="color: white;">����</a></div>
			</c:if>
		</div>
	</div>

</div>
</body>
</html>