<%@page import="pack.ktv_gogek.GogekDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gogekDao" class="pack.ktv_gogek.GogekDao" />
<%
request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");
GogekDto dto = gogekDao.selectDataPart(code);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
- 회원수정 -
<form action="goupdateok.jsp" method="post">
<table border="1" style="text-align: center;">
<tr>
	<td>코드</td>
	<td><input type="text" name="gogek_code" value="<%=dto.getGogek_code()%>" readonly="readonly"></td>
</tr>
<tr>
	<td>ID</td>
	<td><input type="text" name="gogek_id" value="<%=dto.getGogek_id()%>" readonly="readonly"></td>
</tr>
<tr>
	<td>PW</td>
	<td><input type="text" name="gogek_pw" value="<%=dto.getGogek_pw()%>" readonly="readonly"></td>
</tr>
<tr>
	<td>생일</td>
	<td><input type="text" name="gogek_birth" value="<%=dto.getGogek_birth()%>" readonly="readonly"></td>
</tr>
<tr>
	<td>등록일</td>
 	<td><input type="text" name="gogek_regdate" value="<%=dto.getGogek_regdate()%>" readonly="readonly"></td>
</tr>
<tr>
	<td>캐시</td>
	<td><input type="text" name="gogek_cash" value="<%=dto.getGogek_cash()%>" readonly="readonly"></td>
</tr>
<tr>
	<td>상태</td>
	<td>
	<input type="radio" name="상태" value="정상" checked="checked">정상
	<input type="radio" name="상태" value="휴면">휴면
	</td>
</tr>
<tr>
	<td colspan="2">
		<a href="gogek.jsp"><input type="submit" value="수정완료"></a>
		<a href="gogek.jsp"><input type="button" value="수정취소"></a>
	</td>
</tr>
</table>
</form>
</body>
</html>