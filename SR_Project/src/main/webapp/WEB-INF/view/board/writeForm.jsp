<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� �ۼ�</title>
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
    //������������
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "../smarteditor/SmartEditor2Skin.html",
        htParams : {
            // ���� ��� ���� (true:���/ false:������� ����)
            bUseToolbar : true,            
            // �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����)
            bUseVerticalResizer : false,    
            // ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����)
            bUseModeChanger : false,
        }
    });
   

    //���۹�ư Ŭ���̺�Ʈ
    $("#savebutton").click(function(){
        //id�� smarteditor�� textarea�� �����Ϳ��� ����
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
		 var conCk = $("#smarteditor").val(); //���� ��ǲĭ �� ������
         // �� ��ȿ�� �˻�
		if(frm.subject.value == "")    
		{
		alert("������ �Է��� �ּ���");
		frm.subject.focus();					
		return false;                        
		}

		
		if( conCk == ""  || conCk == null || conCk == '&nbsp;' || conCk == '<p>&nbsp;</p>' || conCk == '<p><br></p>')  {
             alert("������ �Է��ϼ���.");
			 editor_object.getById["smarteditor"].exec("FOCUS"); //��Ŀ��
             return false;
        }
         
        //�� submit
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
	
	
	<b>����</b> : <input type="text" name="title" style="width:500px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<b>Ÿ��</b> : <select name="type" style="width:70px;">
						  <option value="1">���</option>
				          <option value="2">����</option>
				          <option value="3">����</option>
				          </select>
	<br><br>

	<div id="bgc"><textarea name="content" id="smarteditor" style="width:698px; height:350px;"></textarea></div>

	<div id="clear"></div>
		
	<div id="btn"><input type="button" id="savebutton" value="�ۼ�"></div>
	
</form:form>	
</div>


</body>
</html>



<!-- 

<div id="formLine">
	<div id="form">
		<form method="post" id="frm" enctype="multipart/form-data" action="notice_write_process.jsp">
				<input type="hidden" name="name" value="���ξ���">
				<b>����</b> : <input type="text" name="subject" style="width:500px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<b>����</b> : <select name="location" style="width:70px;">
				<option value="�����" selected>�����</option>
				<option value="�ϻ���">�ϻ���</option>
				</select>
				<br><br>

		<div id="bgc"><textarea name="content" id="smarteditor" style="width:698px; height:350px;"></textarea></div>
		<div id="img_up">������� : <input type="file" name="filename1" size="38"></div>
		<div id="desc">�ʺ� 290px / ���� 310px ������ ����ϼ���</div>

		<div id="clear"></div>
		
		<div id="btn"><input type="image" src="../images/admin/admin1-1button.gif" id="savebutton" value="���"></div>
		</form>
	</div>
</div>

 -->