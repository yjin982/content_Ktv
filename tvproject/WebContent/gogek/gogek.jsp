<%@page import="pack.ktv_gogek.GogekDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="gogekDao" class="pack.ktv_gogek.GogekDao" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
- 회원관리화면 -<p/>
<% ArrayList<GogekDto> list = (ArrayList<GogekDto>)gogekDao.selectDataAll(); %>
<table border="1" style="text-align: center;width: 100%;">
	<tr style="background-color: red;">
		<td>코드</td>
		<td>ID</td>
		<td>PW</td>
		<td>생일</td>
		<td>등록일</td>
		<td>캐시</td>
	</tr>
	<c:forEach var="s" items="<%=list %>">
	<tr>
		<td>${s.gogek_code }</td>
		<td><a href="goupdate.jsp?code=${s.gogek_code }">${s.gogek_id }</a></td>
		<td>${s.gogek_pw }</td>
		<td>${f:substring(s.gogek_birth, 0, 10) }</td>
		<td>${f:substring(s.gogek_regdate, 0, 10) }</td>
		<td>${s.gogek_cash }</td>
	</tr>
	</c:forEach>
	<tr>	
		<td colspan="6" style="text-align: center;">
			<a href="../admin/conadmin_index.jsp"><input type="button" value="관리자홈"></a>
			
			<a href="godelete.jsp"><input type="button" value="삭제"></a>
		</td>
	</tr>
</table>
</body>
</html>
