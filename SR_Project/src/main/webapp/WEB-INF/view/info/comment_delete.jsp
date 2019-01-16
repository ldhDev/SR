<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<c:if test="${empty user_comment }"> <!-- 사용자가 등록한 코멘트가 없음 -->
<div id="comment">
<!-- 비로그인 사용자가 클릭 시 -->
<c:if test="${sessionScope.member==null}">
	<div id="need_login" onclick="need_login()"></div>
</c:if>

	<div id="comment_star">
		<span class="stars" onmouseleave="out_star()">
			<span id="star1" onmouseover="hover_star(1)" onclick="select_star(1)">★</span>
			<span id="star2" onmouseover="hover_star(2)" onclick="select_star(2)">★</span>
			<span id="star3" onmouseover="hover_star(3)" onclick="select_star(3)">★</span>
			<span id="star4" onmouseover="hover_star(4)" onclick="select_star(4)">★</span>
			<span id="star5" onmouseover="hover_star(5)" onclick="select_star(5)">★</span>
		</span> 
		<span id="sel_star">0</span> / 5&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;font-family: '돋움';color:gray;font-weight:normal;">- 이 대여소는 어떤가요?</span>
	</div><!-- comment_star 라인  -->
	
<form action="" name="comment_form" id="comment_form">

	<input type="hidden" name="choice_star" id="choice_star" value="0">
	<input type="hidden" name="user_id" id="user_id" value="${sessionScope.member.user_id }">
	<input type="hidden" name="user_name" id="user_name" value="${sessionScope.member.name }">
	
		<div id="write">
			<textarea name="content" id="content" placeholder="내용을 입력해주세요" onkeyup="byte_ck(this)"></textarea>
		</div><!-- write 라인  -->
		<div id="submit_line">
			<span id="limit">0</span> / 200 byte
			<div id="sub_btn" onclick="comment_submit()">등록</div>
		</div><!-- submit_line 라인  -->
	
</form><!-- form 끝  -->

</div><!-- comment 라인  -->
</c:if><!-- 비사용자 클릭 끝 -->


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
