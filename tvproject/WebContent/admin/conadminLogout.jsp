<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% session.removeAttribute("adminKey"); %>
로그아웃되셨습니다.
<br><br>
<a href="../index.jsp">홈페이지로..</a>
</body>
</html>