<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8"); 
%>
<jsp:useBean id="gogekBean" class="pack.business.GogekBean" />
<jsp:setProperty property="*" name="gogekBean" />
<jsp:useBean id="gogekProcess" class="pack.business.GogekProcess" />

<%
//System.out.print("gogekBean"); 
boolean b = gogekProcess.insertData(gogekBean); 
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(b){
	out.println("<b>회원가입</b>을 축하합니다<br>");
	out.println("<a href='../index.jsp'>메인으로</a>");
}else{
	out.println("<b>회원가입</b> 실패! 관리자에게 문의 바람<br>");
	out.println("<a href='register.jsp'>가입 재시도</a>");
}
%>
</body>
</html>