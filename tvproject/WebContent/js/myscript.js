function funcLogin() {//로그인 버튼
	// alert('a');
	if (loginForm.id.value === "") {
		alert("로그인 아이디 입력");
		loginForm.id.focus();
	} else if (loginForm.passwd.value === "") {
		alert("비밀번호 입력");
		loginForm.passwd.focus();
	} else {
		loginForm.action = "loginproc.jsp";
		loginForm.method = "post";
		loginForm.submit();
	}
}

function funcReg() {// 로그인창 회원가입 버튼
	// alert('b');
	location.href = "register.jsp";
}

function idCheck() {// 회원가입시 아이디 중복 체크
	// alert('c');
	if (regForm.gogek_id.value === "") {
		alert("id를 입력하시오");
		regForm.gogek_id.focus();
	} else {
		url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "id", "width=300,height=200,top=300,left=300");
	}

}

//회원가입 버튼 누를떄
function sendReg() {
	//alert('d');	
	if (regForm.gogek_pw.value === "") {
		alert("비밀번호를 입력하시오");
		regForm.gogek_pw.focus();
	} else if(regForm.gogek_pw.value !== regForm.re_pw.value) {
		alert("비밀번호를 확인해주세요");
		regForm.gogek_pw.focus();
	} else{
		regForm.submit();
	}	
}