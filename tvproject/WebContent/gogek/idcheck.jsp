<%@page import="pack.business.GogekDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<jsp:useBean id="gogekProcess" class="pack.business.GogekProcess"/> 
<jsp:useBean id="gogekBean" class="pack.business.GogekBean" />
<jsp:setProperty property="*" name="gogekBean"/>

<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("gogek_id");

//gogekBean.setGogek_id(id);

boolean b =  gogekProcess.checkId(gogekBean.getGogek_id());   //회원가입시 아이디 중복 체크 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b><%=id %></b> :
<%
if(b){
%>
	이미 사용 중인 id입니다.<p/>
	<a href="#" onclick="opener.document.regForm.gogek_id.focus(); window.close()">닫기</a>
<%}else{%>
	사용 가능한 id입니다.<p/>
	<a href="#" onclick="opener.document.regForm.gogek_pw.focus(); window.close()">닫기</a>
<%	
}
%>
</body>
</html>