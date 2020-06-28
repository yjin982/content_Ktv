<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="mbean" class="pack.member.MemberBean" />
<jsp:setProperty property="*" name="mbean"/>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr" />

<%
int radioValue = Integer.parseInt(request.getParameter("money"));


int pre_cash = Integer.parseInt(mbean.getGogek_cash());

//System.out.println(pre_cash + "나의 캐시   " + radioValue);

int now_cash = radioValue + pre_cash;
String cash = Integer.toString(now_cash);
boolean b = memberMgr.cashUpdate(mbean, cash);

//String id = (String)session.getAttribute("idKey");

//boolean b = memberMgr.memberUpdate(mbean, id);  

if(b){
%>
	<script>
	alert("충전 완료");
	location.href="mypage.jsp";
	</script>
<% }else{ %>
	<script>
	alert("충전 실패\n관리자에게 문의 바람");
	history.back();
	</script>
<%	
}
%>