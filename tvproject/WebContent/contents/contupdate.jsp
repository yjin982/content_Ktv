<%@page import="pack.ktv_contents.ContDataDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="processDao" class="pack.ktv_contents.ProcessDao" />
<%
request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");
ContDataDto dto = processDao.selectDataPart(code);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
- 작품수정 -
<form action="contupdateok.jsp" method="post">
<table border="1" style="text-align: center;">
<tr>
	<td>코드</td>
	<td><input type="text" name="cont_code" value="<%=dto.getCont_code()%>" readonly="readonly"></td>
</tr>
<tr>
	<td>제목</td>
	<td><input type="text" name="cont_title" value="<%=dto.getCont_title()%>"></td>
</tr>
<tr>
	<td>개봉날짜</td>
	<td><input type="text" name="cont_date" value="<%=dto.getCont_date()%>"></td>
</tr>
<tr>
	<td>장르</td>
	<td><input type="text" name="cont_genre" value="<%=dto.getCont_genre()%>"></td>
</tr>
<tr>
	<td>정보</td>
 	<td><input type="text" name="cont_info" value="<%=dto.getCont_info()%>"></td>
</tr>
<tr>
	<td>이미지</td>
	<td><input type="text" name="cont_image" value="<%=dto.getCont_image()%>"></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="수정완료">
		<a href="contents.jsp"><input type="submit" value="수정취소"></a>
	</td>
</tr>
</table>
</form>
</body>
</html>