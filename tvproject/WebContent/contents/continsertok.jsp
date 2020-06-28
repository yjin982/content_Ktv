<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="contDataBean" class="pack.ktv_contents.ContDataBean" />
<jsp:setProperty property="*" name="contDataBean"/>
<jsp:useBean id="processDao" class="pack.ktv_contents.ProcessDao" />

<%
boolean b = processDao.insertData(contDataBean);

if(b){
	response.sendRedirect("contents.jsp");
}else{
	response.sendRedirect("fail.jsp");
}
%>