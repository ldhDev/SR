<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<div id="comment_list">

<c:forEach var="c_list" items="${comment }">
	<div class="list_panel">
			<div class="user_star">
				<c:forEach var="num" begin="1" end="5" step="1"><c:choose><c:when test="${num <= c_list.score }">¡Ú</c:when><c:otherwise>¡Ù</c:otherwise></c:choose></c:forEach> <span>&nbsp;${c_list.score }</span>
			</div>
			<div class="user_comment">
				${c_list.comment }
			</div>
			<div class="comment_info">
				${c_list.user_name }  |  <fmt:formatDate value="${c_list.regdate }" pattern="yyyy-MM-dd"/>
			</div>
	</div>
</c:forEach>

</div><!-- comment_list ³¡ -->

<div class="page">
	<c:if test="${pageNum > 1}"><a href="javascript:list(${pageNum -1 })"><span style="font-size: 20px;">¢¸</span>&nbsp;&nbsp;</a></c:if>
	<c:if test="${pageNum <= 1 }"><span style="font-size: 20px;">¢¸</span>&nbsp;&nbsp;</c:if>
	<c:forEach var="a" begin="${startpage }" end="${endpage }">
		<c:if test="${a==pageNum }"><div class="page_sel">${a }</div></c:if>
		<c:if test="${a!=pageNum }"><a href="javascript:list(${a })"><div class="page_Nosel">${a }</div></a></c:if>
	</c:forEach>
	<c:if test="${pageNum < maxpage}"><a href="javascript:list(${pageNum +1 })">&nbsp;&nbsp;<span style="font-size: 20px;">¢º</span></a></c:if>
	<c:if test="${pageNum >= maxpage }">&nbsp;&nbsp;<span style="font-size: 20px;">¢º</span></c:if>
</div>