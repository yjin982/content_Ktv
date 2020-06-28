<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>- 관리자 로그인 -</title>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnAdminLogin").onclick = funcAdminLogin;
}

function funcAdminLogin(){
	//alert("a");
	if(conadminLogin.adminid.value === ""){
		alert("ID 입력!");
		conadminLogin.adminid.focus();
		return;
	}
	
	if(conadminLogin.adminpw.value === ""){
		alert("PW 입력!");
		conadminLogin.adminpw.focus();
		return;
	}
	conadminLogin.submit();
	
}
</script>
</head>
<body>
<form action="conadminLoginproc.jsp" name="conadminLogin" method="post">
<table style="width:100" border="1">
	<tr>
		<td colspan="2" style="text-align: center;">
			- 관리자 로그인 -
		</td>
	</tr>
	<tr>
		<td>ID :</td>
		<td><input type="text" name="adminid"></td>
	</tr>
	<tr>
		<td>PW :</td>
		<td><input type="text" name="adminpw"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="button" value="관리자 로그인" id="btnAdminLogin">
		</td>
	</tr>
</table>
</form>
</body>
</html>