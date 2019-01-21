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
  margin: 0 auto;
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
  border-bottom: 3px solid #107307;
}
.td {
  height : 40px;
  display: table-cell;
  border-bottom : 2px solid #D8D8D8;
  vertical-align: middle;
}
.page{
	width:960px;
	height: 50px;
	line-height: 50px;
	margin-top: 25px;
	margin-bottom: 50px;
	text-align: center;
	color: #107307;
	font-weight: bold;
}
.page a{
	color: #107307;
	font-weight: bold;
}
.page_sel{
	width: 28px;
	height: 28px;
	line-height:28px;
	display:inline-block;
	border-radius: 25%;
	margin:0px 2px;
	background-color: #107307;
	color:white;
}
.page_Nosel{
	width: 28px;
	height: 28px;
	line-height:28px;
	display:inline-block;
	margin:0px 2px;
}
.page_Nosel:hover{
	width: 28px;
	height: 28px;
	line-height:28px;
	display:inline-block;
	border-radius: 25%;
	background-color: #107307;
	margin:0px 2px;
	color:white;
}

.button {
  border-radius: 3px;
  background-color: #107307;
  border: none;
  color: white;
  text-align: center;
  font-size: 16px;
  padding: 4px;
  width: 80px;
  transition: all 0.5s;
  cursor: pointer;
  height: 28px;
  line-height:28px;
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
		if(${param.num == null}){
			location.href="list.bike?pageNum="+pageNum;
		}else{
			str = '&num=${param.num}';
			location.href="list.bike?pageNum="+pageNum+str;
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
	
	<div class="table">
		<c:if test="${station.name == null}">
			<div class="caption"><h3 style="margin-top: 30px;">전체 게시판</h3></div>
		</c:if>
		<c:if test="${station.name != null }">
			<div class="caption">
				<h3 style="margin-top: 30px;">${station.number }.${station.name }</h3>
				<p>${staion.address}</p>
			</div>
		</c:if>
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
		    		<c:if test="${station.number != 0}">
			    		<c:if test="${station.number == board.number }">
				      		<div class="td">${board.board_no }</div>
				      		<div class="td">
				      			<c:if test="${board.type == 1}">잡담</c:if>
				      			<c:if test="${board.type == 2}">정보</c:if>
				      			<c:if test="${board.type == 3}">질문</c:if>
				      		</div>
				      		<div class="td"><a href="detail.bike?num=${board.board_no }&number=${param.num }">${board.title }</a></div>
				      		<div class="td">${board.user_name }</div>
				      		<div class="td"><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/></div>
				      		<div class="td">${board.readcnt }</div>
			      		</c:if>
		      		</c:if>
		      		<c:if test="${station.number == 0}">
		      			<div class="td">${board.board_no }</div>
				      	<div class="td">
				      		<c:if test="${board.type == 1}">잡담</c:if>
				      		<c:if test="${board.type == 2}">정보</c:if>
				      		<c:if test="${board.type == 3}">질문</c:if>
				      	</div>
				      	<div class="td"><a href="detail.bike?num=${board.board_no }">${board.title }</a></div>
				      	<div class="td">${board.user_name }</div>
				      	<div class="td"><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/></div>
				      	<div class="td">${board.readcnt }</div>
		      		</c:if>
		    	</div>
	    	</c:forEach>
		</div>
	</div>
	
	<div>
		<c:if test="${listcount == 0 }">
			<div style="width: 200px; line-height: 100px;">등록된 게시물이 없습니다.</div>
		</c:if>
	</div>
	
	<div>
		<div class="page">
			<c:if test="${pageNum > 1}"><a href="javascript:list(${pageNum -1 })"><span style="font-size: 20px;">◀</span>&nbsp;&nbsp;</a></c:if>
			<c:if test="${pageNum <= 1 }"><span style="font-size: 20px;">◀</span>&nbsp;&nbsp;</c:if>
			<c:forEach var="a" begin="${startpage }" end="${endpage }">
				<c:if test="${a==pageNum }"><div class="page_sel">${a }</div></c:if>
				<c:if test="${a!=pageNum }"><a href="javascript:list(${a })"><div class="page_Nosel">${a }</div></a></c:if>
			</c:forEach>
			<c:if test="${pageNum < maxpage}"><a href="javascript:list(${pageNum +1 })">&nbsp;&nbsp;<span style="font-size: 20px;">▶</span></a></c:if>
			<c:if test="${pageNum >= maxpage }">&nbsp;&nbsp;<span style="font-size: 20px;">▶</span></c:if>
		</div>
		<c:if test="${member.name != null}">
			<div class="button">
				<form:form modelAttribute="station" action="writeForm.bike" name="f">
					<form:hidden path="number"/>
					<span style="font-weight: bold;"><a href="javascript:document.f.submit()" style="color: white;">글쓰기</a></span>
				</form:form>
			</div>
		</c:if>
	</div>
</div>

</body>
</html>