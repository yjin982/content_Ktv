<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="adminMgr" class="admin.AdminMgr"  scope="page"/>
<%
String adminid = request.getParameter("adminid");
String adminpw = request.getParameter("adminpw");
 
boolean b = adminMgr.adminLoginCheck(adminid, adminpw);


if(b){
	session.setAttribute("adminKey", adminid);
	response.sendRedirect("conadmin_index.jsp");
}else{
%>
	<script>
	alert("관리자 입력자료 불일치!");
	location.href="conadminLogin.jsp";
	</script>
<%	
}
%>
 