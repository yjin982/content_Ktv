<%@page import="pack.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr" />



<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");

MemberBean bean = memberMgr.getMember(id);  // 로그인 전 테스트


if(bean == null) {
	response.sendRedirect("mypage.jsp");
	return;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>

<script type="text/javascript">
    

    </script>
</head>
<body>
<form action="mydeleteproc.jsp" name="deleteForm" method="post">
<table border="1" style="width: 80%">
	<tr>
		<td colspan="2">
			<b><%=bean.getGogek_id() %></b> 님! 탈퇴 전 회원님의 정보를 확인해주세요!
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=bean.getGogek_id() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=bean.getGogek_pw() %></td>
	</tr>
	<tr>
		<td>생년월일(Y-M-D)</td>
		<td><%=bean.getGogek_birth() %></td>
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
		<input type="submit" value="회원 탈퇴">
		<input type="button" value="탈퇴 취소" onclick="javascript:history.back()">
		</td>
	</tr>
</table>
</form>
</body>
</html>