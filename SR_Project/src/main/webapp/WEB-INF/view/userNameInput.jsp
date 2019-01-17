<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.io.IOException"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>따르릉 따르릉</title>
<style type="text/css">
form
{
	padding-left: 30px;
	padding-top: 200px;
	padding-bottom: 300px;
	font-family: "Nanum Gothic";
}
input
{
	width : 400px;
	height: 70px;
	text-align: center;
	font-size: 25px;
	border-color: #67ec82;	
}


table
{
	text-align: center;
	align-items: center;
}
#notice1
{
	text-align: center;
	font-size: 35px;
	color : green;
	padding-bottom: 10px;
	font-size: 50px;
}
#notice2
{
	text-align: center;
	font-size: 35px;
	color : green;
	padding-bottom: 10px;
	font-size: 30px;
}
.btn_comm
{
	width:184px;
	height: 40px;
	text-align: center;
	font-size: 20px;
	margin-top: 20px;
	cursor: pointer;
	background-color: green;
	color:white;
}
.btn_comm:active
{
	background-color: green;
}
a
{
	text-decoration: none;
}
</style>
</head>

<body>
<c:if test="${nameCheck!=null}">
<script type="text/javascript">
alert("이미 사용중인 아이디 입니다.");
</script>
</c:if>
<form:form modelAttribute="member" action="main3.bike" name="f">

<input type="hidden" name="user_id" value="${my_member.user_id}">
<input type="hidden" name="email" value="${my_member.email}">
<input type="hidden" name="gender" value="${my_member.gender}">
<input type="hidden" name="age" value="${my_member.age}">
<table>
<tr>
<td colspan="2">	
<p id="notice1">※처음 방문하신 이용자 입니다.</p>
<p id="notice2">※사용할 닉네임을 입력해주세요</p>
</td>
</tr>

<tr>
<td colspan="2">
<input type="text" name="name" placeholder=" 닉네임을 입력해주세요">
</td>
</tr>

<tr>
<td>
<button type="submit" class="btn_comm">
입력
</button>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

</td>
</tr>
</table>
</form:form>
</body>
</html>