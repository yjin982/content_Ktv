<%@page import="java.util.ArrayList"%>
<%@page import="tvproject.pro.business.ReviewDto"%>
<%@page import="tvproject.pro.business.GenreTopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="genreProcess" class="tvproject.pro.business.GenreProcess" />
<jsp:useBean id="reviewProcess" class="tvproject.pro.business.ReviewProcess" />
<% String id = (String)session.getAttribute("idKey"); %>
<% 
	String c = request.getParameter("code"); 
	pageContext.setAttribute("code", c);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로그램 상세보기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function check(){
	var uid = "<%=session.getAttribute("idKey") %>";

	if(uid){
		reFrm.submit();
	}else{
		//alert("plz login");
		return false;
	}
}

function proLike(no, code){
	var uid = "<%=session.getAttribute("idKey") %>";
	location.href = "likeproc.jsp?like="+ no + "&code=" + code + "&id=" + uid;
}
//////////////////////////////
$(document).ready(function(){
	$("#kvideo").click(function(e) {
		var uid = "<%=session.getAttribute("idKey") %>";
		if(uid == "null"){
			alert("로그인해주세요!");
		}
	});
});
</script>
</head>
<body>
<%@ include file="../gogek/top.jsp" %>

<div class="container ">
	<c:set var="dto" value="${genreProcess.selectProDetail(code)}" />
	
	
	<div class="row">
		<div class="col-8">
			<img id="kvideo" src="../upload/${dto.cont_image}" width="100%" height="300px"><!-- ----------------- -->
			<br><br>
			<span style="font-size: 30px;"><b>${dto.cont_title}</b></span>&nbsp;&nbsp;${dto.cont_date} <!-- ----------------- -->
			<!-- ${dto.cont_like}&nbsp;&nbsp;<button id="btnLike" onclick="proLike('${dto.cont_like}', '${dto.cont_code}')">♥</button> -->
		</div>
		<div class="col-2">
			${dto.cont_info}
		</div>
	</div>
	
	<br><br><br>
	
	<form action="reviewsave.jsp" name="reFrm" method="post">
	<div class="row">
		<div class="col-auto my-1">
			<label for="revId">아이디</label>
			<input type="text" class="form-control" id="revId" name="id" readonly="readonly" value="<%=id%>">
		</div>
		<div class="col-auto my-1">
			<label for="revPw">비밀번호</label>
			<input type="password" class="form-control" id="revPw" name="rev_pw">
		</div>
	</div>
	
	<div class="row">
		<div class="col">
		<label for="reviewTitle">제목</label>
		<input type="text" class="form-control" id="reviewTitle" name="rev_title">
		</div>
	</div>
		<div class="form-group" style="display: none;">
			<label for="exampleFormControlSelect1">별점</label>
		  	<select class="form-control" id="exampleFormControlSelect1" name="star">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>
		</div>
	<div class="row">
		<div class="col form-group">
			<label for="FormControlTextarea1">리뷰</label>
			<textarea class="form-control" id="FormControlTextarea1" rows="3" name="rev_cont"></textarea>
		</div>	
	</div>
	<input type="hidden" name="rev_ccode" value="${code}"> 
	<input type="hidden" name="rev_gcode" value="${uid}"><!-- 작품코드 -->
	<button type="submit" class="btn btn-outline-info btn-lg" onclick="check()">제출</button>
	</form>
	<br><br><br>
	
	<%
		String genre = (String)pageContext.getAttribute("gm");
		ArrayList<ReviewDto> list = (ArrayList<ReviewDto>)reviewProcess.getAllReview(c);
		String user = "";
	%>
	<h2>Reviews</h2>
	<c:forEach var="i" items="<%=list %>">
	<hr>
	<div class="row" style="height: 30px;">
		<div class="col-2">
			<c:set var="userId" value="${i.rev_gcode}" />
			<%
				String a = (String)pageContext.getAttribute("userId");
				user = reviewProcess.getGogekId(a); 
			%>
			<b>ID</b> : <%=user %>
		</div>
		<div class="col-2">
			${i.rev_title}
		</div>
	</div>
	<hr>
	<div class="row" style="height: 150px;">
		<div class="col-10">
			${i.rev_cont}
		</div>
	</div>
	</c:forEach>

	<br><br><br><br><br><br>

</div>
<br>
<%@ include file="../gogek/bottom.jsp" %>




<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>