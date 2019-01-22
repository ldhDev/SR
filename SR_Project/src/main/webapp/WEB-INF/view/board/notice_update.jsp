<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file = "/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항 수정</title>
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
	width: 960px;
	padding-top: 40px;
	margin: 0 auto;
}

.button {
  width: 80px;
  height: 45px;
  border-radius:5px;
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  float: left;
}

#btns{
	width : 170px;
	height : 45px;
	float: right;
}

.btn-group .button:hover {
  background-color: #0E7518;
}

#wrap{
	width: 1020px;
	height: 850px;
	margin: 0 auto;
	margin-top: 40px;
}

.caption{
	width: 1015px;
	height: 65px;
	line-height: 65px;
	padding-left:5px;
	font-size:18px;
	border-bottom: 3px solid #107307;
	margin-bottom: 20px;
}

.line{
	margin:0 auto;
	width : 960px;
	height : 25px;
	margin-bottom: 15px;
}

.tag{
	width : 80px;
	height : 25px;
	line-height: 22px;
	float: left;
	font-family: "Nanum Gothic";
	font-weight: 700;
	font-size: 16px;
}

#title{
	width : 880px;
	height : 25px;
	float: left;
	padding-left: 5px;
	box-sizing: border-box;
}

label{
	cursor: pointer;
}

#con{
	width : 960px;
	height : 450px;
	box-sizing: border-box;
	margin: 0 auto;
}

.nicEdit-main:focus{
	outline: none;
}

.con_line{
	margin:0 auto;
	margin-top: 25px;
	width : 960px;
	height : 520px;
}

</style>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
<script src="/SR_Project/nicedit/nicEdit.js" type="text/javascript"></script>
<script type="text/javascript"> 
bkLib.onDomLoaded(function() { nicEditors.allTextAreas() }); 

function frm(write_form){

	if(document.f.title.value == "" || document.f.title.value == null){
		alert("제목을 입력해주세요");
		document.f.title.focus();
		return false;
	}
	
	var conCk = $("div.nicEdit-main").html();
	
	if( conCk == ""  || conCk == null || conCk == '&nbsp;' || conCk == '<p>&nbsp;</p>' || conCk == '<p><br></p>' || conCk == '<br>')  {
		alert("내용을 입력해주세요");
		return false;
	}
	
	document.f.content.value = conCk; 
	write_form.submit();

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

<div class="caption"><h3>공지사항 수정</h3></div>


<div id="writeFrom">
<form:form modelAttribute="board" action="notice_update.bike" name="f" id="frm">
	<form:hidden path="board_no"/>
	<form:hidden path="number"/>
	<form:hidden path="type"/>
	<div class="line">
		<div class="tag">제목</div><div><form:input id="title" path="title" placeholder="제목을 입력해주세요" /></div>
	</div>

	<div class="con_line">
		<div style="display: inline;"><textarea id="con">${board.content }</textarea></div>
		<input type="hidden" name="content" value="">
	</div>
	
	<div id="btns">
		<div class="btn-group">
		 	<button type="button" class="button" id="savebutton" style="margin-right: 10px;" onclick="frm(this.form);">수정</button>
		</div>
		<div class="btn-group">
			<button  type="button" class="button" onclick="javascript:history.go(-1)">취소</button>
		</div>
	</div>

</form:form>	
</div><!-- writeFrom 닫음 -->

</div><!-- wrap 닫음 -->


</body>
</html>