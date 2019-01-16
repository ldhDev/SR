<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:if test="${empty user_comment }"> <!-- ����ڰ� ����� �ڸ�Ʈ�� ���� -->
<div id="comment">
<!-- ��α��� ����ڰ� Ŭ�� �� -->
<c:if test="${sessionScope.member==null}">
	<div id="need_login" onclick="need_login()"></div>
</c:if>

	<div id="comment_star">
		<span class="stars" onmouseleave="out_star()">
			<span id="star1" onmouseover="hover_star(1)" onclick="select_star(1)">��</span>
			<span id="star2" onmouseover="hover_star(2)" onclick="select_star(2)">��</span>
			<span id="star3" onmouseover="hover_star(3)" onclick="select_star(3)">��</span>
			<span id="star4" onmouseover="hover_star(4)" onclick="select_star(4)">��</span>
			<span id="star5" onmouseover="hover_star(5)" onclick="select_star(5)">��</span>
		</span> 
		<span id="sel_star">0</span> / 5&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;font-family: '����';color:gray;font-weight:normal;">- �� �뿩�Ҵ� �����?</span>
	</div><!-- comment_star ����  -->
	
<form action="" name="comment_form" id="comment_form">

	<input type="hidden" name="choice_star" id="choice_star" value="0">
	<input type="hidden" name="user_id" id="user_id" value="${sessionScope.member.user_id }">
	<input type="hidden" name="user_name" id="user_name" value="${sessionScope.member.name }">
	
		<div id="write">
			<textarea name="content" id="content" placeholder="������ �Է����ּ���" onkeyup="byte_ck(this)"></textarea>
		</div><!-- write ����  -->
		<div id="submit_line">
			<span id="limit">0</span> / 200 byte
			<div id="sub_btn" onclick="comment_submit()">���</div>
		</div><!-- submit_line ����  -->
	
</form><!-- form ��  -->

</div><!-- comment ����  -->
</c:if><!-- ������ Ŭ�� �� -->


<div id="comment_line"></div>


<c:if test="${!empty comment }">
<div id="comment_pannel">

<div id="comment_list">

<c:forEach var="c_list" items="${comment }">
	<div class="list_panel">
			<div class="user_star">
				<c:forEach var="num" begin="1" end="5" step="1"><c:choose><c:when test="${num <= c_list.score }">��</c:when><c:otherwise>��</c:otherwise></c:choose></c:forEach> <span>&nbsp;${c_list.score }</span>
			</div>
			<div class="user_comment">
				${c_list.comment }
			</div>
			<div class="comment_info">
				${c_list.user_name }  |  <fmt:formatDate value="${c_list.regdate }" pattern="yyyy-MM-dd"/>
			</div>
	</div>
</c:forEach>

</div><!-- comment_list �� -->

<div class="page">
	<c:if test="${pageNum > 1}"><a href="javascript:list(${pageNum -1 })"><span style="font-size: 20px;">��</span>&nbsp;&nbsp;</a></c:if>
	<c:if test="${pageNum <= 1 }"><span style="font-size: 20px;">��</span>&nbsp;&nbsp;</c:if>
	<c:forEach var="a" begin="${startpage }" end="${endpage }">
		<c:if test="${a==pageNum }"><div class="page_sel">${a }</div></c:if>
		<c:if test="${a!=pageNum }"><a href="javascript:list(${a })"><div class="page_Nosel">${a }</div></a></c:if>
	</c:forEach>
	<c:if test="${pageNum < maxpage}"><a href="javascript:list(${pageNum +1 })">&nbsp;&nbsp;<span style="font-size: 20px;">��</span></a></c:if>
	<c:if test="${pageNum >= maxpage }">&nbsp;&nbsp;<span style="font-size: 20px;">��</span></c:if>
</div>

</div><!-- �ڸ�Ʈ �ǳ� �� -->

</c:if><!-- ${!empty comment } �� �� -->

<c:if test="${empty comment }">
	<div id="comment_not_exist">
	���� ��ϵ� �뿩�� �Ѹ��� �����ϴ�, ���� ���� �뿩�� �Ѹ��� ���ܺ�����!
	</div>
</c:if><!-- ${empty comment } �� �� -->
