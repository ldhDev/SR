<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
	width: 900px;
	padding: 70px; 
	padding-top: 40px;
}
.line{
	margin-bottom: 15px;
}
.tag{
	width : 80px;
	float: left;
}
.btn-group .button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 10px 15px;
  text-align: center;
  text-decoration: none;
  font-size: 16px;
  cursor: pointer;
  float: left;
}
.btn-group .button:hover {
  background-color: #0E7518;
}
</style>



<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="../smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "../smarteditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : false,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false,
        }
    });
   

    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
		 var conCk = $("#smarteditor").val(); //내용 인풋칸 값 가져옴
         // 폼 유효성 검사
		if(frm.subject.value == "")    
		{
		alert("제목을 입력해 주세요");
		frm.subject.focus();					
		return false;                        
		}

		
		if( conCk == ""  || conCk == null || conCk == '&nbsp;' || conCk == '<p>&nbsp;</p>' || conCk == '<p><br></p>')  {
             alert("내용을 입력하세요.");
			 editor_object.getById["smarteditor"].exec("FOCUS"); //포커싱
             return false;
        }
         
        //폼 submit
        $("#frm").submit();
    })
	
})

</script>

</head>
<body>

<div id="main_img_bar">
	<div id="main_img">
		<img src="../img/main_img.jpg" style="height: 170px;width: 1020px;">
	</div>
</div>

<div id="writeFrom">
<form:form modelAttribute="board" action="write.bike" name="f" id="frm">
	<form:hidden path="number"/>
	<form:hidden path="user_id"/>
	<form:hidden path="user_name"/>
	
	
	<b>제목</b> : <input type="text" name="title" style="width:500px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<b>타입</b> : <select name="type" style="width:70px;">
						  <option value="1">잡담</option>
				          <option value="2">정보</option>
				          <option value="3">질문</option>
				          </select>
	<br><br>

	<div id="bgc"><textarea name="content" id="smarteditor" style="width:698px; height:350px;"></textarea></div>

	<div id="clear"></div>
		
	<div id="btn"><input type="button" id="savebutton" value="작성"></div>
	
</form:form>	
</div>


</body>
</html>



<!-- 

<div id="formLine">
	<div id="form">
		<form method="post" id="frm" enctype="multipart/form-data" action="notice_write_process.jsp">
				<input type="hidden" name="name" value="라인앤핏">
				<b>제목</b> : <input type="text" name="subject" style="width:500px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<b>지점</b> : <select name="location" style="width:70px;">
				<option value="상암점" selected>상암점</option>
				<option value="일산점">일산점</option>
				</select>
				<br><br>

		<div id="bgc"><textarea name="content" id="smarteditor" style="width:698px; height:350px;"></textarea></div>
		<div id="img_up">사진등록 : <input type="file" name="filename1" size="38"></div>
		<div id="desc">너비 290px / 높이 310px 비율로 등록하세요</div>

		<div id="clear"></div>
		
		<div id="btn"><input type="image" src="../images/admin/admin1-1button.gif" id="savebutton" value="등록"></div>
		</form>
	</div>
</div>

 -->