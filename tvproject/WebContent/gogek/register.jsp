<%@page import="pack.business.GogekProcess"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/myscript.js"></script>
<script type="text/javascript">
	/*
	 window.onload = function(){
	 regForm.gogek_id.focus();
	 document.getElementById("btnId").onclick = idCheck;
	 document.getElementById("btnSubmit").onclick = sendReg;
	 }
	 */

	$(document).ready(function() {
		$("#gogek_id").focus();
		$("#btnId").click(idCheck);
		$("#btnSubmit").click(sendReg);
	});

	function idCheck() {// 회원가입시 아이디 중복 체크
		// alert('c');
		if ($("#gogek_id").val() === "") {
			alert("id를 입력하시오");
			$("#gogek_id").focus();
		} else {
			url = "idcheck.jsp?gogek_id=" + regForm.gogek_id.value;
			window.open(url, "gogek_id",
					"width=300,height=200,top=300,left=300");
		}

	}

	function sendReg() {
		//alert('d');	
		if ($("#gogek_pw").val() === "") {
			alert("비밀번호를 입력하시오");
			$("#gogek_pw").focus();
		} else if ($("#gogek_pw").val() !== $("#re_pw").val()) {
			alert("비밀번호를 확인해주세요");
			$("#gogek_pw").focus();
		} else {
			regForm.submit();
		}
	}
</script>
</head>
<body>
	<form name="regForm" method="post" action="registerproc.jsp">
	<div class="container">
<div class="form-row">
<div class="col align-self-center">
<div class="form-group col-md-4">
		<label id="exampleInputId1" class="form-control">회원가입</label>
		</div>
		<div class="form-group col-md-4">
			<label for="gogek_id">아이디</label> 
			<input type="text" class="form-control" name="gogek_id" id="gogek_id"> 
				<input type="button" value="ID중복확인" class="btn btn-primary" id="btnId">
		</div>
		<div class="form-group col-md-4">
			<label for="gogek_pw">비밀번호</label> 
			<input type="password" class="form-control" id="gogek_pw" name="gogek_pw">
		</div>
	<div class="form-group col-md-4">
			<label for="re_pw">비밀번호 확인</label> 
			<input type="password" class="form-control" id="re_pw" name="re_pw">
		</div>
		<div class="form-group col-md-4">
	 <button type="button" class="btn btn-primary" id="btnSubmit">회원가입</button>
	  <button type="reset" class="btn btn-primary">다시쓰기</button>	
	  </div>
	</form>

	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</div>
</div>
</div>
</body>
</html>