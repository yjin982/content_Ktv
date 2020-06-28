<%@page import="pack.mycontent.MycontDto" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="contentProcess" class="pack.mycontent.MycontProcess" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="../gogek/top.jsp" %>
<%@include file="mypage_top.jsp" %>
<div class="container">
	
<h1>*내 구매 목록*</h1>
<div class="row">
<table border="1">
	<tr>
		<th>코드</th><th>작품 명</th><th>구매 날짜</th>
	</tr>
	<% ArrayList<MycontDto> list = (ArrayList<MycontDto>)contentProcess.selectDataAll(); %>
	<c:set var="list" value="<%=list %>" />
	<c:if test="${empty list }">
	<tr><td colspan="3">자료 없음</td></tr>
	</c:if>
	<c:forEach var="m" items="<%=list %>">
	<tr> 
		<td>${m.buy_gcode }</td>
		<td><a href="???.jsp?id=${m.buy_ccode }">${m.buy_ccode }</a></td>
		<td>${m.buy_date }</td>
		<!--  <td>${f:substring(m.reg_date,0,10)}</td> -->
 	</tr>
	</c:forEach>
	<tr>
		<td colspan="3" style="color: red;">
		작품명 누르면 정보 조회
		</td>
	</tr>
</table>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>