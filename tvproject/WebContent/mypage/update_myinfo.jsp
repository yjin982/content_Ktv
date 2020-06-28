<%@page import="pack.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr" />



<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");

MemberBean bean = memberMgr.getMember(id);  // 로그인 전 테스트


if(bean == null) { 

//<script>alert("로그인을 먼저 해주세요!");</script>

	response.sendRedirect("mypage.jsp");
	return;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="../gogek/top.jsp" %>
<%@include file="mypage_top.jsp" %>
<div class="container">
	<div class="row">
<form action="myupdateproc.jsp" name="updateForm" method="post">
<table border="1" style="width: 80%">
	<tr>
		<td colspan="2">
			<b><%=bean.getGogek_id() %></b> 회원님의 정보를 수정합니다.
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=bean.getGogek_id() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="text" name="gogek_pw" value="<%=bean.getGogek_pw() %>"></td>
	</tr>
	<tr>
		<td>생년월일(Y-M-D)</td>
		<td><input type="text" name="gogek_birth" value="<%=bean.getGogek_birth() %>"></td>
	</tr>
<%--
	<tr>
		<td>등록일</td>
		<td><input type="text" name="regdate" value="<%=bean.getGogek_regdate() %>" /></td>
	</tr>
--%>
	<tr>
		<td>캐시</td>
		<td><%=bean.getGogek_cash() %></td>
	</tr>
	
	<tr>
		<td colspan="2" style="text-align: center;">
		<input type="hidden" name="gogek_id" value="<%=bean.getGogek_id() %>">
		<input type="submit" value="수정완료">
		<input type="button" value="수정취소" onclick="javascript:history.back()">
		</td>
	</tr>
</table>
</form>
<br><br>
</div></div>
<br><br><br><br><br><br>
<%@ include file="../gogek/bottom.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>