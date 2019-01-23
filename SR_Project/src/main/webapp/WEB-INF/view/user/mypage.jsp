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
.bookmark{
	width: 485px; 
	height:500px; 
	margin-left:500px;
	border-style: outset; 
	padding-top: 25px;
	padding-left: 20px;
	padding-bottom: 30px;
}

.bookmark p{
	padding: 5px;
}
.bookmark .up{
	margin-top: 50px;
	padding: 5px;
}
.address{
	padding-top:70px; 
	padding-left: 35px; 
	width: 290px; 
	height: 50px;
}
#my{
	width: 410px; 
	height:500px; 
	float: left; 
	padding-bottom: 40px; 
	margin-left: 25px; 
	padding-left: 20px;
	padding-top: 15px;
	border-style: outset; 
	
}
.btns{
	margin: 0 auto;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    width: 70px;
    height: 45px;
    line-height: 45px;
    color: white;
    border-radius: 5px;
    background-color: #107307;
    float: left;
    cursor: pointer;
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
	<div id="my">
		<div class="info">
			<h3>내정보</h3>
			<p>닉네임</p> 
			<form:form modelAttribute="member" name="f" action="update.bike">
				<form:input path="name"/>
				<a href="javascript:document.f.submit()" id="up" style="color: white;">수정</a>
			</form:form>
		</div>
		<div class="info">	
		
			<p>성별</p>
			<c:if test="${member.gender == 'M'}">
				<p class="value">남자</p>
			</c:if>
			<c:if test="${member.gender != 'M'}">
				<p class="value">여자</p>
			</c:if>    
		</div>
		<div class="info">	
			<p>나이</p>  
			<p class="value">${member.age }대</p>
		</div>
		<div class="info">	
			<p>이메일</p> 
			<p class="value">${member.email }</p> 
		</div>
		
		<div style="padding-left: 300px; padding-top: 50px;"><a class="btns" href="delete.bike" style="color: white;">탈퇴</a></div>
		
	</div>
	<div class="bookmark" style="">
		<h3 style="padding-top:10px;">즐겨찾기</h3>
		<div style="margin-top: 15px; height: 50px; padding-bottom: 30px;" >
			<div style="float: left; width: 110px;">
				<p>즐겨찾기1.</p>
			</div>
			<c:if test="${member.bookmark1 == 0}">
				<div style="line-height: 34px;"><p>없음</p></div>
			</c:if>
			<c:if test="${member.bookmark1 != 0}">
				<div style="float: left; width:270px; white-space:normal;"><p>${station1.name}</p></div><div style="width:70px; line-height:44px; float: right;"><a id="up" href="bookmark_delete.bike?number=${station1.number }" style="color: white;">제거</a></div>
				<div class ="address">${station1.address }</div>
			</c:if>
		</div>
		<div style="height: 50px; padding-bottom: 30px; margin-top: 70px;" >
			<div style="float: left; width: 110px;">
				<p>즐겨찾기2.</p>
			</div>
			<c:if test="${member.bookmark2 == 0}">
				<div style="line-height: 34px;"><p>없음</p></div>
			</c:if>
			<c:if test="${member.bookmark2 != 0}">
				<div style="float: left; width:270px; white-space:normal;"><p>${station2.name}</p></div><div style="width:70px; line-height:44px; float: right;"><a id="up" href="bookmark_delete.bike?number=${station2.number }" style="color: white;">제거</a></div>
				<div class ="address">${station2.address }</div>
			</c:if>
		</div>
		<div style="height: 50px; padding-bottom: 30px; margin-top: 70px;" >
			<div style="float: left; width: 110px;">
				<p>즐겨찾기3.</p>
			</div>
			<c:if test="${member.bookmark3 == 0}">
				<div style="line-height: 34px;"><p>없음</p></div>
			</c:if>
			<c:if test="${member.bookmark3 != 0}">
				<div style="float: left; width:270px; white-space:normal;"><p>${station3.name}</p></div><div style="width:70px; line-height:44px; float: right;"><a id="up" href="bookmark_delete.bike?number=${station3.number }" style="color: white;">제거</a></div>
				<div class ="address">${station3.address }</div>
			</c:if>
		</div>
	</div>

</div>
</body>
</html>