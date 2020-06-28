<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String memid = (String)session.getAttribute("idKey");

String log = "";
if(memid == null){
	log = "<a class='nav-link' href='../gogek/login.jsp'>로그인</a>";
}else{
	log = "<a class='nav-link' href='../gogek/logout.jsp'>로그아웃</a>";
}

%>
<nav class="navbar navbar-expand-lg bg-danger navbar-dark" style="background-color: #e3f2fd; font-size: 1.5em;">
<div class="container">

	<a class="navbar-brand" href="../gogek/index2.jsp">
		<img src="http://www.kicedu.co.kr/images/h1_logo.png"  height="100" class="d-inline-block align-top" alt="">
	</a>
	
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="../gogek/index2.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../program/top10.jsp">전체목록</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="../program/showgenre.jsp">장르별</a>
      </li>
	  <li class="nav-item">
        <a class="nav-link" href="../mypage/mypage.jsp">마이페이지</a>
      </li>
	  <li class="nav-item">
        <%=log %>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" name="searchFrm" action="../program/searchresult.jsp" method="post"><!-- ----------------- -->
      <input class="form-control mr-sm-2" type="search" name="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-dark my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
  
</div>
</nav>


<br><br>