<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
- 회원추가 -
<form action="goinsertok.jsp" method="post">
<table border="1" style="text-align: center;">
<tr>
	<td>코드</td>
	<td><input type="text" name="gogek_code"></td>
</tr>
<tr>
	<td>ID</td>
	<td><input type="text" name="gogek_id"></td>
</tr>
<tr>
	<td>PW</td>
	<td><input type="text" name="gogek_pw"></td>
</tr>
<tr>
	<td>생일</td>
	<td><input type="text" name="gogek_birth"></td>
</tr>
<tr>
	<td>등록일</td>
	<td><input type="text" name="gogek_regdate"></td>
</tr>
<tr>
	<td>캐시</td>
	<td><input type="text" name="gogek_cash"></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" value="추가">
	<a href="gogek.jsp"><input type="button" value="추가취소"></a>
	</td>
</tr>
</table>
</form>
</body>
</html>

