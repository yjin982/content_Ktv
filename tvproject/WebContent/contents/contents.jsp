<%@page import="pack.ktv_contents.ContDataDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="processDao" class="pack.ktv_contents.ProcessDao"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
- 작품관리화면-<p/>
<% ArrayList<ContDataDto> list = (ArrayList<ContDataDto>)processDao.selectDataAll(); %>
<table border="1" style="text-align: center;width: 100%;">
	<tr style="background-color: orange;">
		<td>코드</td>
		<td>제목</td>
		<td>개봉날짜</td>
		<td>장르</td>
		<td>정보</td>
		<td>좋아요</td>
		<td>이미지</td>
	</tr>
	<c:forEach var="s" items="<%=list %>">
	<tr>
		<td>${s.cont_code}</td>
		<td><a href="contupdate.jsp?code=${s.cont_code}">${s.cont_title}</a></td>
		<td>${f:substring (s.cont_date, 0, 10)}</td>
		<td>${s.cont_genre}</td>
		<td>${s.cont_info}</td>
		<td>${s.cont_like}</td>
		<td>${s.cont_image}</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="7" style="text-align: center;">
			<a href="../admin/conadmin_index.jsp"><input type="button" value="관리자홈"></a>
			<a href="continsert.jsp"><input type="button" value="추가"></a>
			<a href="contdelete.jsp"><input type="button" value="삭제"></a>
		</td>
	</tr>
</table>
</body>
</html>