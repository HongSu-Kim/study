var checkNum;

function join() {

	var result = true;
		
	if (check('checkNum')) {
		document.getElementById('checkNum').focus();
		result = false;
	}
	
	if (check('tel2')) {
		document.getElementById('tel2').focus();
		result = false;
	}
	
	if (check('email')) {
		document.getElementById('email').focus();
		result = false;
	}
	
	if (check('gender')) {
		document.getElementById('gender').focus();
		result = false;
	}
	
	if (check('day')) {
		document.getElementById('day').focus();
		result = false;
	}
	
	if (check('month')) {
		result = false;
	}
	
	if (check('year')) {
		document.getElementById('year').focus();
		result = false;
	}
	
	if (check('name')) {
		document.getElementById('name').focus();
		result = false;
	}
	
	if (check('pwdc')) {
		document.getElementById('pwdc').focus();
		result = false;
	}
	
	if (check('pwd')) {
		document.getElementById('pwd').focus();
		result = false;
	}
	
	if (check('id')) {
		document.getElementById('id').focus();
		result = false;
	}
	
	if(result)
		alert("회원가입!")
		
}

function getCheckNum() {
	
	if (check("tel2")) {
		document.getElementById('tel2').focus();
		return;
	}

	checkNum = Math.floor(Math.random() * 999999);
	alert("전화번호: " + document.getElementById('tel2').value + "\n인증번호: " + checkNum);
	document.getElementById('checkNum').value = checkNum;
	document.getElementById('checkNum').focus();
}

function inputHighlight(id) {

	document.getElementById(id + "Box").style = "outline-color: #03C75A";
	
}

function inputFocus(id) {

	document.getElementById(id).focus();
	
}

function infoNone(id) {
	
	if (document.getElementById(id).value) {
		document.getElementById(id + "Info").style.display = "none";
	} else {
		document.getElementById(id + "Info").style.display = "block";
	}
}

function check(id) {

	var f = document.myForm;

	document.getElementById(id + "Box").style = "outline-color: #DADADA";
	
	try {
		document.getElementById(id + "MsgNull").style.display = "none";
	} catch (e) {
	}
	try {
		document.getElementById(id + "MsgErr").style.display = "none";
	} catch (e) {
	}
	
	if ((id == 'id' || id == 'name' || id == 'gender')
			&& !document.getElementById(id).value) {
		
			document.getElementById(id + "MsgNull").style.display = "block";
			return true;
			
	} else if ((id == 'pwd' || id == 'pwdc')
				&& !document.getElementById(id).value) {

		document.getElementById(id + "2Image").style.display = "none";
		try {
			document.getElementById(id + "2Text").style.display = "none";
			document.getElementById(id + "3Image").style.display = "block";
			document.getElementById(id + "3Text").style.display = "block";
		} catch (e) {
		}
		document.getElementById(id + "MsgNull").style.display = "block";
		return true;
		
	} else if ((id == 'year' || id == 'month' || id == 'day')
				&& document.getElementById('year').value.length != 4) {
		
		document.getElementById("monthMsgErr").style.display = "none";
		document.getElementById("dayMsgErr").style.display = "none";
		document.getElementById("yearMsgErr").style.display = "block";
		return true;
		
	} else if ((id == 'month' || id == 'day')
				&& !document.getElementById('month').value) {
		
		document.getElementById("dayMsgErr").style.display = "none";
		document.getElementById("monthMsgErr").style.display = "block";
		return true;
		
	} else if ((id == 'tel2' || id == 'checkNum')
				&& !document.getElementById('tel2').value) {

		document.getElementById("tel2MsgNull").style.display = "block";
		document.getElementById("tel2MsgErr").style.display = "none";
		document.getElementById("checkNumMsgErr").style.display = "none";
		return true;
		
//	} else if ((id == 'tel2' || id == 'checkNum')
//			&& ) {
//
//		document.getElementById("tel2MsgNull").style.display = "none";
//		document.getElementById("tel2MsgErr").style.display = "block";
//		document.getElementById("checkNumMsgErr").style.display = "none";
//		return true;
//		
	}  else if (id == 'id' && document.getElementById(id).value.length < 5
			|| id == 'day' && !document.getElementById(id).value
//			|| id == 'email' &&
			|| id == 'checkNum' && checkNum != document.getElementById(id).value) {
		
		document.getElementById(id + "MsgErr").style.display = "block";
		return true;
		
	} else if (id == 'pwd' && document.getElementById(id).value.length < 8) {
		
		document.getElementById(id + "MsgErr").style.display = "block";
		document.getElementById("pwd2Image").style.display = "none";
		document.getElementById("pwd2Text").style.display = "none";
		document.getElementById("pwd3Image").style.display = "block";
		document.getElementById("pwd3Text").style.display = "block";
		return true;
		
	} else if (id == 'pwdc' && document.getElementById('pwd').value != document.getElementById(id).value) {
		
		document.getElementById(id + "MsgErr").style.display = "block";
		document.getElementById("pwdc2Image").style.display = "none";
		return true;
		
	} else if (id == 'pwd' || id == 'pwdc'){
		
		document.getElementById(id + "2Image").style.display = "block";
		try {
			document.getElementById(id + "2Text").style.display = "block";
			document.getElementById(id + "3Image").style.display = "none";
			document.getElementById(id + "3Text").style.display = "none";
		} catch (e) {
		}
		
	}
	
	return false;
	
}
