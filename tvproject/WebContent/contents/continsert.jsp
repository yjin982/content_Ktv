<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
- 작품추가 -
<form action="continsertok.jsp" method="post">
<table border="1" style="text-align: center;">
<tr>
	<td>코드</td>
	<td><input type="text" name="cont_code"></td>
</tr>
<tr>
	<td>제목</td>
	<td><input type="text" name="cont_title"></td>
</tr>
<tr>
	<td>개봉날짜</td>
	<td><input type="text" name="cont_date"></td>
</tr>
<tr>
	<td>장르</td>
	<td><input type="text" name="cont_genre"></td>
</tr>
<tr>
	<td>정보</td>
 	<td><input type="text" name="cont_info"></td>
</tr>
<tr>
	<td>좋아요</td>
	<td><input type="text" name="cont_like"></td>
</tr>
<tr>
	<td>이미지</td>
	<td><input type="text" name="cont_image"></td>
</tr>
<tr>
	<td colspan="2">
	<input type="submit" value="추가">
	<a href="contents.jsp"><input type="button" value="추가취소"></a>
	</td>	
</tr>
</table>

</form>
</body>
</html>