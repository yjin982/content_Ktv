<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%String id = (String)session.getAttribute("idKey"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="../js/myscript.js" ></script>
<script type="text/javascript">
window.onload = function(){
	loginForm.gogek_id.focus();
	document.getElementById("btnLogin").onclick = funcLogin;
	document.getElementById("btnRegister").onclick = funcReg;
	
}


function funcLogin() {//로그인 버튼
	// alert('a');
	if (loginForm.gogek_id.value === "") {
		alert("로그인 아이디 입력");
		loginForm.gogek_id.focus();
	} else if (loginForm.gogek_pw.value === "") {
		alert("비밀번호 입력");
		loginForm.gogek_pw.focus();
	} else {
		loginForm.submit();
	}
}

function funcReg() {// 로그인창 회원가입 버튼
	// alert('b');
	location.href = "register.jsp";
}

</script>

</head>
<body>
<%
if(id != null){
%>	
	
	<b><%= id %>님 환영합니다</b>
	<br>준비된 기능을 사용할 수 있습니다<br>
	<a href="logout.jsp">로그아웃</a>
	
<%}else{%>
<form name="loginForm" method="post" action="loginproc.jsp">
<div class="container">
<div class="form-row">
<div class="col align-self-center" >
	<div class="form-group col-md-4">
    	<label for="exampleInputId1">아이디</label>
   		 <input type="text" name="gogek_id" class="form-control" id="exampleInputId1" >
	</div>
	<div class="form-group col-md-4">
    	<label for="exampleInputPassword1">비밀번호</label>
   	 	<input type="password" name="gogek_pw" class="form-control" id="exampleInputPassword1">
 	 </div>
 	 <div class="form-group col-md-4">
 	  <button type="button" class="btn btn-primary" id="btnLogin">로그인</button>	
 	  <button type="button" class="btn btn-primary" id="btnRegister">회원가입</button>
 	  </div>	
   </div>
</div>
</div>
</form>
<%
}
%>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


</body>
</html>