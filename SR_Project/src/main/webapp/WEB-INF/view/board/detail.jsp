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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script type="text/javascript">
	function re(replynum){
		if(${param.number == null}){
			location.href="replydelete.bike?replynum="+replynum+"&num="+${param.num};
		}else{
			str = "&number=${param.number}";
			location.href="replydelete.bike?replynum="+replynum+str+"&num="+${param.num};
		}
	}
	var on_off=new Array();
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
			<c:if test="${station.name == null }">
				<h3>전체 게시글</h3>
			</c:if>
			<c:if test="${station.name != null }">
				<h3>${b.number }.${station.name }</h3>
				<p>${station.address }</p>
			</c:if>
		</div>
		<c:if test="${member.user_id == b.user_id}">
			<div class="btn-group">
			 	 <button class="button" onclick="location.href='delete.bike?num=${b.board_no}&number=${b.number }'">삭제</button>
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
	
	<div id="content" style="width: 1000px;">${b.content }</div>
	
	<div id="list">
		<c:if test="${empty param.number }">
			<a href="list.bike" style="color: white;">목록</a>
		</c:if>
		<c:if test="${!empty param.number }">
			<a href="list.bike?num=${param.number }" style="color: white;">목록</a>
		</c:if>
	</div>
	<br><br><br>
	
	<div style="background-color: #FAFAFA; padding: 20p; margin-bottom:100px; ">
			<div style="padding: 30px;">
				<form:form modelAttribute="reply" action="addreply.bike" name="ref">
					<form:hidden path="board_no"/>
					<c:forEach items="${replylist }" var="list" varStatus="stat">
						<div style="float: left; padding-right: 10px; font-weight: bold;">${list.user_name }</div><div style="float: left; color: #A4A4A4; font-size: small; padding-right: 10px;"><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></div>
						<c:if test="${member.user_id == list.user_id}">
							<div style="float: left;"><a id="test${stat.index }">답글 </a>|&nbsp;</div>
							<div><a href="javascript:re(${list.reply_no})">삭제</a></div>
						</c:if>
						<c:if test="${member.user_id != list.user_id}">
							<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
						</c:if>
						<div style="border-bottom: 1px dotted #D8D8D8; padding-bottom: 20px;">${list.content }</div>
						<div id="content_answer${stat.index }"></div>
						
						<script type="text/javascript">
						on_off.push(true);
							$(document).ready(function(){
								$("#test"+${stat.index}).click(function(){
									if(on_off[${stat.index}]){
										var html_text='<div style="padding: 30px; padding-top: 0px;"><form:form modelAttribute="reply" action="addreply.bike" name="rf"><form:hidden path="board_no"/><c:if test="${!empty member.user_id }"> <div style="float: left;"><form:input path="content"/></div> <div style="height: 50px; padding: 10px; padding-top: 15px;"><a href="javascript:document.rf.submit()" style="margin-left:20px; padding:13px; border: 1px solid #BDBDBD; background-color: white;">등록</a></div> </c:if> </form:form> </div>'
										on_off[${stat.index}]=false;
									}else if(!on_off[${stat.index}]){
										var html_text='';
										on_off[${stat.index}]=true;
									}
									$("#content_answer"+${stat.index}).html(html_text);
								})
							})
						</script>
						
					</c:forEach>
				</form:form>
			</div>
			
		<div style="padding: 30px; padding-top: 0px;">
			<form:form modelAttribute="reply" action="addreply.bike" name="f">
			<form:hidden path="board_no"/>
				<c:if test="${!empty member.user_id }">
					<div style="float: left;"><form:input path="content"/></div>
					<div style="height: 50px; padding: 10px; padding-top: 15px;"><a href="javascript:document.f.submit()" style="margin-left:20px; padding:13px; border: 1px solid #BDBDBD; background-color: white;">등록</a></div>
				</c:if>
			</form:form>
		</div>
	</div>
</div>
</body>
</html>