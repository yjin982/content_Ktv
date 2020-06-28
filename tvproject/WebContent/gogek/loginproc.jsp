
<%@page import="pack.business.GogekBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="gogekBean" class="pack.business.GogekBean"/>
<jsp:setProperty property="*" name="gogekBean"/>
<jsp:useBean id="gogekProcess" class="pack.business.GogekProcess"/>

<%
//System.out.println(request.getParameter("gogek_id"));
System.out.println(gogekBean.getGogek_id() +gogekBean.getGogek_pw());

boolean b = gogekProcess.selectData(gogekBean);
System.out.println(b);
if(b){
	session.setAttribute("idKey", gogekBean.getGogek_id());
	response.sendRedirect("../index.jsp");	
	
}else{
	response.sendRedirect("../gogek/loginfail.jsp");
}
%>
