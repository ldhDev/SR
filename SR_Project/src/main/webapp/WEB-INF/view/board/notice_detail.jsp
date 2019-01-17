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
	padding-bottom: 30px;
	width: 800px;
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
<script type="text/javascript">
	function reply_disp(id){
		var disp = document.getElementById(id);
		if(disp.style.display == 'block'){
			disp.style.display = "none";
		}else{
			disp.style.display = "block"
		}
	}
	function re(replynum){
		if(${param.number == null}){
			location.href="replydelete.bike?replynum="+replynum+"&num="+${param.num};
		}else{
			str = "&number=${param.number}";
			location.href="replydelete.bike?replynum="+replynum+str+"&num="+${param.num};
		}
	}
</script>
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
</body>
</html>