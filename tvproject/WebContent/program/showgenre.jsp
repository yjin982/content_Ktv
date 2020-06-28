<%@page import="tvproject.pro.business.GenreTopDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="genreProcess" class="tvproject.pro.business.GenreProcess" />
<% ArrayList<GenreTopDto> list2 = null; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장르별 보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="../js/programscript.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("div.gAjax").click(function(e) {
		$(this).next("div.titles").toggle("");
	});
});
</script>
<style type="text/css">
.titles { display: none; }
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="../gogek/top.jsp" %>
<div class="container">
<% ArrayList<GenreTopDto> list1 = (ArrayList<GenreTopDto>)genreProcess.selectGenreAll();  %>
<c:forEach var="g" items="<%=list1 %>">
	<div class="row">
		<div class="gAjax">${g.cont_genre}</div>
			<div class="titles">
			<c:set var="gm" value="${g.cont_genre}" />
				<%
					String genre = (String)pageContext.getAttribute("gm");
					list2 = (ArrayList<GenreTopDto>)genreProcess.selectGenrePro(genre);  
				%>
			<c:forEach var="p" items="<%=list2 %>"> <!-- 장르별 작품 이름 -->
				<a href="programdetail.jsp?code=${p.cont_code}">
					<span><img id="contTitle" src="../images/${p.cont_image}" width="200" height="200"></span>
					&nbsp;	${p.cont_title}
				</a>
			</c:forEach>
		</div>	
	</div>
	<hr>
</c:forEach>


</div>
<br>
<%@ include file="../gogek/bottom.jsp" %>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>