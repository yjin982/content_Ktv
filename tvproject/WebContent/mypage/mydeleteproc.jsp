<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="mbean" class="pack.member.MemberBean" />
<jsp:setProperty property="*" name="mbean"/>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr" />

<%
String id = (String)session.getAttribute("idKey");

boolean b = memberMgr.memberDelete(mbean, id);  

if(b){
%>
	<script>
	alert("정말 탈퇴하시겠습니까?");
	alert("탈퇴 성공");
	location.href="../gogek/index2.jsp";
	//session.removeAttribute("idKey");  
	</script>
<% }else{ %>
	<script>
	alert("탈퇴 실패\n관리자에게 문의 바람");
	history.back();
	</script>
<%	
}
%>