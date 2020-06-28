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
<title>캐쉬 충전</title>
</head>
<body>
	<form action="addcashproc.jsp" method="post">
        <label for = "cash">충전 금액 선택 : </label>
        
        <input type="hidden" name="gogek_id" value="<%=bean.getGogek_id() %>">
      	<input type="hidden" name="gogek_pw" value="<%=bean.getGogek_pw() %>">
      	<input type="hidden" name="gogek_birth" value="<%=bean.getGogek_birth() %>">
      	<input type="hidden" name="gogek_cash" value="<%=bean.getGogek_cash() %>">

        
        <input type = "radio" name = "money" value = "1000" checked="checked">1000원
        <input type = "radio" name = "money" value = "5000">5000원
        <input type = "radio" name = "money" value = "10000">10000원
        <input type = "radio" name = "money" value = "50000">50000원
        
        <input type = "submit" value ="충전하기">
    </form>
</body>
</html>