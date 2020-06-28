<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="tvproject.pro.business.GenreTopBean"></jsp:useBean>
<jsp:useBean id="genreProcess" class="tvproject.pro.business.GenreProcess" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	bean.setCont_like(Integer.parseInt(request.getParameter("like")));
	String c = request.getParameter("code");
	bean.setCont_code(c);
	boolean b = genreProcess.updateLike(bean);
	
	if(b){
		response.sendRedirect("programdetail.jsp?code=" + c);
	}else{
		response.sendRedirect("fail.jsp");
	}

%>