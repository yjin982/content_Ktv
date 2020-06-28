<%@page import="tvproject.pro.business.GenreTopDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="genreProcess" class="tvproject.pro.business.GenreProcess" />
<% 
	request.setCharacterEncoding("utf-8");
	String s = request.getParameter("search");
	ArrayList<GenreTopDto> list = (ArrayList<GenreTopDto>)genreProcess.selectSearch(s);  
	
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/programscript.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="../gogek/top.jsp" %>
<div class="container">
<c:forEach var="g" items="<%=list %>">
	<div class="row">
		<div class="col-3">
			<img src="../images/${g.cont_image}" width="200" height="200">
		</div>
		<div class="col-6">
			<a href="programdetail.jsp?code=${g.cont_code}"><h1>${g.cont_title}</h1></a><br>
			<span style="font-size: 1.2em;">
				${g.cont_info}
			</span>
		</div>
	</div>
	<br>
</c:forEach>
</div>
<br>
<%@ include file="../gogek/bottom.jsp" %>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>