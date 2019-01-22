<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 안내</title>
<style type="text/css">
#wrap{
	width: 1020px;
	margin: 0 auto;
	margin-top: 20px;
	margin-bottom: 45px; 
}

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
	padding-bottom:5px;
}

#content_line{
	width: 1020px;
	border: 1px solid #107307;
}

#get_board{
	width: 1020px;
	height: 76px;
	border-bottom: 1px dashed #107307;
	font-size: 16px;
	color: #2E2E2E
}

#title_line{
	width: 1020px;
	height: 48px;
	line-height: 48px;
	box-sizing: border-box;
	padding-left: 10px;
	font-weight: bold;
	font-size: 26px;
	background-color: #f2f7f2;
}
#writer_line{
	width: 1020px; 
	height: 28px;
	line-height: 28px;
	box-sizing: border-box;
	padding-left: 10px;
	font-size: 12px;
}

#content{
	color: #585858;
	width: 1020px; 
	min-height: 100px;
	margin-top: 15px; 
	margin-bottom: 35px;
	box-sizing: border-box;
	padding: 0px 25px;
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

.top{
	width: 1020px;
	height: 55px;
}

.btn-group{
	width: 220px;
	height: 45px;
	margin: 15px 0px;
	float: right;
}
</style>

</head>
<body>
<div id="main_img_bar">
	<div id="main_img">
		<img src="../img/main_img.jpg" style="height: 170px;width: 1020px;">
	</div>
</div>



<div id="wrap">

<div id="board">
	<c:set value="${board}" var="b"/>
	<br>
	<div class="top">
		<div style="float: left">
				<h2>공지사항</h2>
		</div>
		
	</div>
<div id="content_line">
	<div id="get_board">
		<div id="title_line">
			${b.title}
		</div>
		<div id="writer_line">
			<fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/>
		</div>
	</div>
	<br>
	
	<div id="content">${b.content }</div>

</div><!-- content_line 끝 -->
	<div class="btn-group">
			<a href="notice.bike" style="color: white;"><div class="btns" <c:if test="${member.user_id != 109393762 && member.user_id != 33226414 && member.user_id != 171187454}">style="float:right;"</c:if> >목록</div></a>
		<c:if test="${member.user_id == 109393762 || member.user_id == 33226414 || member.user_id == 171187454}">
			<div class="btns" onclick="location.href='notice_update.bike?num=${b.board_no}'" style="margin-left: 5px; margin-right: 5px;">수정</div>
			<div class="btns" onclick="location.href='noticedelete.bike?num=${b.board_no}'">삭제</div>
		</c:if>
	</div>
	<div style="clear: both;"></div>

</div><!-- 보드 -->

</div><!-- 랩 -->









<!--  


<div id="board">
	<c:set value="${board}" var="b"/>
	<br>
	<div class="top">
		<div style="float: left">
			<h3>공지사항</h3>
		</div>
		<c:if test="${member.user_id == 109393762 || member.user_id == 33226414}">
			<div class="btn-group">
			 	 <button class="button" onclick="location.href='noticedelete.bike?num=${b.board_no}'">삭제</button>
			 	 <button class="button" onclick="location.href='notice_update.bike?num=${b.board_no}'">수정</button>
			</div>
		</c:if>
	</div>
	<div id="get_board">
		${b.title}<br>
		작성자. ${b.user_name}&nbsp;&nbsp;&nbsp;
		<fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;
	</div>
	<br>
	
	<div id="content" style="width: 1000px;">${b.content }</div>
	
	<div id="list">
		<a href="notice.bike" style="color: white;">목록</a>
	</div>

	
	
</div>
-->
</body>
</html>