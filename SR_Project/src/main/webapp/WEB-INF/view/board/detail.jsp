<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상세보기</title>
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
	border-bottom: 2px solid #107307;
}

#content_line{
	width: 1020px;
	border: 1px solid #107307;
}

#get_board{
	width: 1020px;
	height: 73px;
	border-bottom: 1px dashed #107307;
	font-size: 16px;
	color: #2E2E2E
}

#title_line{
	width: 1020px;
	height: 45px;
	line-height: 40px;
	box-sizing: border-box;
	padding-left: 10px;
	font-weight: bold;
	font-size: 20px;
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

#reply_panel{
	width: 1020px;
}

.re_list{
	width: 1020px;
	min-height: 80px;
}

.re_writer{
	width: 1020px;
	height: 40px;
	line-height: 40px;
	margin-bottom: 3px;
}

.re_re{
	width: 1020px;
	min-height: 80px;
	background-color: #f6f9f5;
}

.re_re_arrow{
	width: 75px;
	height:80px;
	box-sizing: border-box;
	padding-top: 20px;
	float: left;
	
}

.re_re_list{
	width: 945px;
	min-height: 80px;
	float: right;
}

.re_re_writer{
	width: 945px;
	height: 40px;
	line-height: 40px;
	margin-bottom: 3px;
	float: left;
}

.re_input{
	width: 1020px;
	height: 60px;
	margin-bottom: 30px;
	margin-top: 30px;
}

#no_login{
	width: 1020px;
	height: 60px;
	line-height: 60px;
	text-align:center;
	font-weight:700;
	font-size:16px;
	color:gray;
	font-family: "Nanum Gothic";
}

.re_input textarea{
	width: 900px;
	height: 60px;
	float: left;
	box-sizing: border-box;
	padding: 5px 10px;
}

.re_btn{
    background-color: #107307;
    border-radius: 5px;
    color: white;
    box-sizing: border-box;
    text-align: center;
    float: left;
    margin-left: 10px;
    width: 100px;
    height: 60px;
    line-height: 60px;
    cursor: pointer;
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
	
	function re_reply(no,re_order){
		
		if(on_off[re_order]){
			var html_text='<div class="re_input" style="margin-top:10px;margin-bottom:10px;"><input type="hidden" name="reply_no" value="'+no+'"><input type="hidden" name="board_no" value="${param.num}"><textarea style="width:850px; margin-left:50px;" class="re_content" name="content"></textarea><div class="re_btn" onclick="javascript:document.re_re'+re_order+'.submit()">등록</div></form></div>'
			on_off[re_order]=false;
		}else if(!on_off[re_order]){
			var html_text='';
			on_off[re_order]=true;
		}
		$("#content_answer"+re_order).html(html_text);
	}
</script>
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
			<c:if test="${station.name == null }">
				<h2>전체 게시글</h2>
			</c:if>
			<c:if test="${station.name != null }">
				<h2>${b.number }.${station.name }</h2>${station.address }
			</c:if>
		</div>
		
	</div>
<div id="content_line">
	<div id="get_board">
		<div id="title_line">
			<c:if test="${b.type == 1}">[잡담]</c:if>
			<c:if test="${b.type == 2}">[정보]</c:if>
			<c:if test="${b.type == 3}">[질문]</c:if>
			&nbsp;${b.title}<br>
		</div>
		<div id="writer_line">
			<b>${b.user_name}</b>&nbsp;&nbsp;|&nbsp;&nbsp;
			<fmt:formatDate value="${b.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/>
		</div>
	
		
		
	</div>
	<br>
	
	<div id="content">${b.content }</div>

</div><!-- content_line 끝 -->
	<div class="btn-group">
		<c:if test="${empty param.number }">
		
			<a href="list.bike" style="color: white;"><div class="btns" <c:if test="${member.user_id != b.user_id}">style="float:right;"</c:if> >목록</div></a>
		</c:if>
		<c:if test="${!empty param.number }">
			<a href="list.bike?num=${param.number }" style="color: white;"><div class="btns" <c:if test="${member.user_id != b.user_id}">style="float:right;"</c:if>>목록</div></a>
		</c:if>
		<c:if test="${member.user_id == b.user_id}">
			<div class="btns" onclick="location.href='update.bike?num=${b.board_no}'" style="margin-left: 5px; margin-right: 5px;">수정</div>
			<div class="btns" onclick="location.href='delete.bike?num=${b.board_no}&number=${b.number }'">삭제</div>
		</c:if>
	</div>
	<div style="clear: both;"></div>
	<br><br><br>


<!-- ///////////////////덧글라인///////////////////// -->

<div class="top" style="font-size:18px; height:50px; line-height:50px; border-bottom: 2px solid #107307;"><h3>댓글</h3></div>

	<div id="reply_panel">
	
		<c:forEach items="${replylist }" var="list" varStatus="stat">
			<c:if test="${list.reflevel <1 }"><!-- 대댓글이 아닌것들 -->
				<div class="re_list">
					<div class="re_writer">
						<b>${list.user_name }</b>&nbsp;
						<span style="color: #A4A4A4; font-size: small;"><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></span>
						&nbsp;
						<c:if test="${member.user_id == list.user_id}">
							<span style="font-size: small; cursor: pointer;">
								<span onclick="re_reply(${list.reply_no},${stat.index })" >답글 </span>&nbsp;|&nbsp;
								<a href="javascript:re(${list.reply_no})">삭제</a>
							</span>
						</c:if>
						<c:if test="${member.user_id != list.user_id}">
							<c:if test="${!empty member.user_id}">
								<span style="font-size: small; cursor: pointer;"> 
								<span onclick="re_reply(${list.reply_no},${stat.index })" >답글 </span>
							</span>
							</c:if>
						</c:if>
					</div><!-- re_writer 끝 -->
					
					<div style="border-bottom: 1px dotted #107307; padding-bottom: 20px;">${list.content }</div>
					<form action="re_reply.bike" name="re_re${stat.index }" method="post">
					<div id="content_answer${stat.index }"></div>
					</form>
				</div><!-- re_list 끝 -->
				
				<script type="text/javascript">
					on_off.push(true);
				</script>
			</c:if>
			
			
			<c:if test="${list.reflevel >0 }"><!-- 대댓글 -->
			<div class="re_re" style="border-bottom: 1px dotted #107307; ">
				<div class="re_re_arrow">
					<img src="/SR_Project/img/board/reply_arrow.png">
				</div>
				<div class="re_re_list">
					<div class="re_re_writer">
						<b>${list.user_name }</b>&nbsp;
						<span style="color: #A4A4A4; font-size: small;"><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd"/></span>
						&nbsp;
						<c:if test="${member.user_id == list.user_id}">
							<span style="font-size: small; cursor: pointer;">
								<a href="javascript:re(${list.reply_no})">삭제</a>
							</span>
						</c:if>
					</div><!-- re_writer 끝 -->
					
					<div>${list.content }</div>
				<!--	<form action="re_reply.bike" name="re_re${stat.index }" method="post">
					<div id="content_answer${stat.index }"></div>
					</form> -->
				</div><!-- re_list 끝 -->
				<script type="text/javascript">
					on_off.push(true);
				</script>
				</div>
				<div style="clear: both;"></div>
			</c:if>
		</c:forEach>
			
		<div class="re_input">
			<form:form modelAttribute="reply" action="addreply.bike" name="f">
			<form:hidden path="board_no"/>
				<c:if test="${!empty member.user_id }">
						<textarea class="re_content" name="content"></textarea>
						<div class="re_btn" onclick="javascript:document.f.submit()">
							등록
						</div>
				</c:if>
				<c:if test="${empty member.user_id }">
						<div id="no_login">댓글 작성은 로그인이 필요합니다</div>
				</c:if>
			</form:form>
		</div>
	
	<div style="clear: both;"></div>

	</div> <!-- 리플판넬 끝 -->
	
</div> <!-- board div 끝 -->



		
</div>
</body>
</html>