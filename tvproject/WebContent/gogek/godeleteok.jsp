<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gogekBean" class="pack.ktv_gogek.GogekBean" />
<jsp:setProperty property="*" name="gogekBean"/>
<jsp:useBean id="gogekDao" class="pack.ktv_gogek.GogekDao" />

<%
boolean b = gogekDao.deleteData(gogekBean);

if(b){
	response.sendRedirect("gogek.jsp");
}else{
	response.sendRedirect("../contents/fail.jsp");
}
%>