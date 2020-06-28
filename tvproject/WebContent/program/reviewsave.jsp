<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bean" class="tvproject.pro.business.ReviewBean" />
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="reviewProcess" class="tvproject.pro.business.ReviewProcess" scope="page" />

<% 
	String id = (String)session.getAttribute("idKey");
	String idcode = reviewProcess.getGogekCode(id);
	bean.setRev_gcode(idcode); /// id가 id값이 아니라 코드로 들어가야함
	//System.out.print(bean.getRev_gcode() + "    " + bean.getRev_ccode() + "     " + bean.getRev_title());

	
	if(bean.getRev_gcode() == null){
		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>alert('로그인해주세요!'); location.href='../gogek/login.jsp';</script>");
	}else{
		boolean b = reviewProcess.insertReview(bean);
		response.sendRedirect("programdetail.jsp?code=" + bean.getRev_ccode());
	}
%>