<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 목록</title>
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
	padding-bottom: 50px;
}

.table {
  display: table;
  border: none;
  width: 950px;
  text-align: center;
}
.caption {
  display: table-caption;
  caption-side: top;
  text-align: left;
  height : 60px;
}
.thead{
  display: table-header-group;
}
.tbody{
  display: table-row-group;
}
.tr {
  display: table-row;
}
.tr_nohover {
  display: table-row;
}
.tr:hover {
  background-color: #E0F8F1;
}
.th {
  height : 45px;
  text-align : center;
  font-weight : bold;
  display: table-cell;
  vertical-align :middle;
  border-bottom: 3px solid #A9F5BC;
}
.td {
  height : 40px;
  display: table-cell;
  border-bottom : 2px solid #D8D8D8;
  vertical-align: middle;
}
.page{
	width:200px;
	padding-right: 20px;
	margin-top : 5px;
	margin-right: 250px;
	margin-left: 360px;
	text-align: center;
	float: left;	
}

.button {
  border-radius: 3px;
  background-color: #A9F5BC;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 16px;
  padding: 4px;
  width: 80px;
  transition: all 0.5s;
  cursor: pointer;
  height: 28px;
  margin: 7px 87%;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -15px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 10px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}

</style>
<script type="text/javascript">
	function list(pageNum){
			location.href="list.bike?pageNum=" + pageNum;
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
	<div class="table">
		<div class="caption"><h3 style="margin-top: 30px;">공지사항</h3></div>
		<div class="thead">
	    	<div class="tr_nohover">
			    <div class="th" style="width:7%">No.</div>
			    <div class="th" style="width:7%">글타입</div>
			    <div class="th" style="width:60%">제목</div>
			    <div class="th" style="width:10%">작성자</div>
			    <div class="th" style="width:10%">등록일</div>
			    <div class="th" style="width:6%">조회수</div>
	  		</div>
	  	</div>
		<div class="tbody">
			<c:forEach items="${boardlist }" var="board">
		    	<div class="tr">
		      			<div class="td">${board.board_no }</div>
				      	<div class="td">
				      		공지사항
				      	</div>
				      	<div class="td"><a href="notice_detail.bike?num=${board.board_no }">${board.title }</a></div>
				      	<div class="td">${board.user_name }</div>
				      	<div class="td"><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/></div>
				      	<div class="td">${board.readcnt }</div>
		    	</div>
	    	</c:forEach>
		</div>
	</div>
	
	<div>
		<c:if test="${member.user_id == 109393762 || member.user_id == 33226414}">
			<div class="button">
				<span style="font-weight: bold;"><a href="noticewriteForm.bike">글쓰기</a></span>
			</div>
		</c:if>
	</div>
</div>

</body>
</html>