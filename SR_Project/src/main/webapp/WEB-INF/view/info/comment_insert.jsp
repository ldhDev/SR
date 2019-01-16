<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:if test="${!empty user_comment }"> <!-- 사용자가 등록한 코멘트가 있음 -->
<div id="comment" style="border:2px solid green;height: 202px;width: 962px; ">

	<div id="comment_star" style="border-color: #85d179;">
		<span class="stars">
			<span id="star1">★</span>
			<span id="star2">★</span>
			<span id="star3">★</span>
			<span id="star4">★</span>
			<span id="star5">★</span>
		</span> 
		<span id="sel_star">${user_comment.score}</span> / 5&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;font-family: '돋움';color:green;font-weight:normal;">- 내가 쓴 한마디</span>
	</div><!-- comment_star 라인  -->
	
<form action="" name="comment_form" id="comment_form">

	<input type="hidden" name="choice_star" id="choice_star" value="${user_comment.score}">
	<input type="hidden" name="user_id" id="user_id" value="${sessionScope.member.user_id }">
	<input type="hidden" name="user_name" id="user_name" value="${sessionScope.member.name }">
	
		<div id="write">
			<textarea name="content" id="content" readonly="readonly" style="outline: none;">${user_comment.comment}</textarea>
		</div><!-- write 라인  -->
		<div id="submit_line">
			<div id="sub_btn" onclick="comment_delete()">삭제</div>
		</div><!-- submit_line 라인  -->
	
</form><!-- form 끝  -->

</div>

<script type="text/javascript">
out_star();
</script>



</c:if> <!-- 등록한 코멘트가 있을 때 if 끝 -->


<div id="comment_line"></div>


<c:if test="${!empty comment }">
<div id="comment_pannel">

<div id="comment_list">

<c:forEach var="c_list" items="${comment }">
	<div class="list_panel">
			<div class="user_star">
				<c:forEach var="num" begin="1" end="5" step="1"><c:choose><c:when test="${num <= c_list.score }">★</c:when><c:otherwise>☆</c:otherwise></c:choose></c:forEach> <span>&nbsp;${c_list.score }</span>
			</div>
			<div class="user_comment">
				${c_list.comment }
			</div>
			<div class="comment_info">
				${c_list.user_name }  |  <fmt:formatDate value="${c_list.regdate }" pattern="yyyy-MM-dd"/>
			</div>
	</div>
</c:forEach>

</div><!-- comment_list 끝 -->

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

</div><!-- 코멘트 판넬 끝 -->

</c:if><!-- ${!empty comment } 의 끝 -->

<c:if test="${empty comment }">
	<div id="comment_not_exist">
	아직 등록된 대여소 한마디가 없습니다, 가장 먼저 대여소 한마디를 남겨보세요!
	</div>
</c:if><!-- ${empty comment } 의 끝 -->
