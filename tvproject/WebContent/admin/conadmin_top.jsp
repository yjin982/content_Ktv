<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
String adminId = (String)session.getAttribute("adminKey");
if(adminId == null){
	response.sendRedirect("conadminLogin.jsp");
	return;
}
%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<table style="width : 100%">
	<tr>
		<td colspan="4" style="text-align: center;">
			<b>관리자페이지</b>
		</td>
	</tr>
	<tr style="text-align: center;">	
		<td><a href="../index.jsp"><button type="button" class="btn btn-primary">홈페이지</button></a></td>
		<td><a href="../gogek/gogek.jsp"><button type="button" class="btn btn-success">회원관리</button></a></td>
		<td><a href="../contents/contents.jsp"><button type="button" class="btn btn-info">작품관리</button> </a></td>
		<td><a href="conadminLogout.jsp"><button type="button" class="btn btn-danger">로그아웃</button></a></td>
	</tr>
</table>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>