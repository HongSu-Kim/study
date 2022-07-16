var checkNum;

function check() {

	var f = document.myForm;

	if (!f.id.value) {
		alert("아이디를 입력하세요!");
		f.id.focus();
		return;
	}

	if (!f.pwd.value) {
		alert("비밀번호를 입력하세요!");
		f.pwd.focus();
		return;
	}

	if (!f.pwdc.value) {
		alert("비밀번호를 입력하세요!");
		f.pwdc.focus();
		return;
	} else if (f.pwd.value != f.pwdc.value) {
		alert("비밀번호를 확인하세요!");
		f.pwdc.value = ""
		f.pwdc.focus();
		return;
	}

	if (!f.name.value) {
		alert("이름을 입력하세요!");
		f.name.focus();
		return;
	}

	if (!f.year.value) {
		alert("태어난 년도를 입력하세요!");
		f.year.focus();
		return;
	}

	if (!f.month.value) {
		alert("태어난 월를 선택하세요!");
		f.month.focus();
		return;
	}

	if (!f.day.value) {
		alert("태어난 일(날짜)를 입력하세요!");
		f.day.focus();
		return;
	}

	if (!f.tel2.value) {
		alert("전화번호를 입력하세요!");
		f.tel2.focus();
		return;
	}

	if (!f.checkNum.value) {
		alert("인증번호를 입력하세요!");
		f.checkNum.focus();
		return;
	} else if (f.checkNum.value != n) {
		alert("인증번호를 확인하세요!");
		f.checkNum.focus();
		return;
	}

	alert("회원가입!")

}

function getCheckNum() {

	var f = document.myForm;

	if (!f.tel2.value) {
		alert("전화번호를 입력하세요!");
		f.tel2.focus();
		return;
	}

	checkNum = Math.floor(Math.random() * 999999);
	alert("전화번호: " + f.tel2.value + "\n인증번호: " + checkNum);
	f.checkNum.value = checkNum;
}

function inputHighlight(name) {

}

//function inputFocus(name) {
//	document.myForm.name.focus();
//}

function inputFocus(name) {

	var f = document.myForm;
	alert(f);
	
//	var na = name;
//	f.na.focus();
//	return;
	
	switch (name) {
	case "id": f.id.focus(); break;
	case "pwd": f.pwd.focus(); break;
	case "pwdc": f.pwdc.focus(); break;
	case "name": f.name.focus(); break;
	case "year": f.year.focus(); break;
	case "day": f.day.focus(); break;
	case "email": f.email.focus(); break;
	case "tel2": f.tel2.focus(); break;
	case "checkNum": f.checkNum.focus(); break;
	}
	
}