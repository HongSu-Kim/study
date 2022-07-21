var checkNum;

function inputFocus(id) {
	document.getElementById(id).focus();
}

function inputHighlight(id) {
	document.getElementById(id + "Box").style = "outline-color: #03C75A";
}

function infoNone(id) {

	if (document.getElementById(id).value)
		document.getElementById(id + "Info").style.display = "none";
	else
		document.getElementById(id + "Info").style.display = "block";

}

function getCheckNum() {

	if (check("tel")) {
		document.getElementById('tel').focus();
		return;
	}

	checkNum = Math.floor(Math.random() * 8999 + 1000);
	alert("[Web발신]\n[네이버] 인증번호[" + checkNum + "]를 입력해주세요.");
	document.getElementById('checkNum').value = checkNum;
	document.getElementById('checkNum').focus();
	document.getElementById("checkNumMsgChe").style.display = "block";
	
}

function check(id) {
	
	document.getElementById(id + "Box").style = "outline-color: #DADADA";

	if (id == 'id') {
		
		var regId = /^[a-z0-9]*$/;

		document.getElementById(id + "Msg").style.display = "none";
		document.getElementById(id + "MsgNull").style.display = "none";
		document.getElementById(id + "MsgErr").style.display = "none";
		
		if (!document.getElementById(id).value) {

			document.getElementById(id + "MsgNull").style.display = "block";
			return true;
		
		} else if (document.getElementById(id).value.length < 5 || !regId.test(document.getElementById(id).value)) {

			document.getElementById(id + "MsgErr").style.display = "block";
			return true;
		
		}
		
		document.getElementById(id + "Msg").style.display = "block";
	
	} else if (id == 'pwd') {

		var regPwd = /^[a-zA-Z0-9]*$/;
		
		document.getElementById(id + "MsgNull").style.display = "none";
		document.getElementById(id + "MsgErr").style.display = "none";
		
		document.getElementById("pwd2Image").style.display = "none";
		document.getElementById("pwd2Text").style.display = "none";
		document.getElementById("pwd3Image").style.display = "none";
		document.getElementById("pwd3Text").style.display = "none";
		
		if (!document.getElementById(id).value) {
			
			document.getElementById(id + "MsgNull").style.display = "block";
			return true;
			
		} else if (document.getElementById(id).value.length < 8 || !regPwd.test(document.getElementById(id).value)) {

			document.getElementById(id + "MsgErr").style.display = "block";
			
			document.getElementById("pwd3Image").style.display = "block";
			document.getElementById("pwd3Text").style.display = "block";
			return true;
			
		}
		
		document.getElementById("pwd2Image").style.display = "block";
		document.getElementById("pwd2Text").style.display = "block";

	} else if (id == 'pwdc') {
		
		document.getElementById(id + "MsgNull").style.display = "none";
		document.getElementById(id + "MsgErr").style.display = "none";

		document.getElementById("pwdc2Image").style.display = "none";
		
		if (!document.getElementById(id).value) {
			
			document.getElementById(id + "MsgNull").style.display = "block";
			return true;
			
		} else if (document.getElementById(id).value != document.getElementById('pwd').value) {

			document.getElementById(id + "MsgErr").style.display = "block";
			return true;
			
		}
		
		document.getElementById("pwdc2Image").style.display = "block";

	} else if (id == 'name') {
		
		var regName = /^[a-zA-Z가-힣]*$/;

		document.getElementById(id + "MsgNull").style.display = "none";
		document.getElementById(id + "MsgErr").style.display = "none";
		
		if (!document.getElementById(id).value) {
			
			document.getElementById(id + "MsgNull").style.display = "block";
			return true;
			
		} else if (!regName.test(document.getElementById(id).value)) {

			document.getElementById(id + "MsgErr").style.display = "block";
			return true;
			
		}
		
	// birth
	} else if (id == 'year' || id == 'month' || id == 'day') {
		
		document.getElementById("yearMsgErr").style.display = "none";
		document.getElementById("monthMsgErr").style.display = "none"; 
		document.getElementById("dayMsgErr").style.display = "none";
		document.getElementById("birthMsgErr1").style.display = "none";
		document.getElementById("birthMsgErr2").style.display = "none";
		
		if (document.getElementById('year').value.length != 4
				|| isNaN(parseInt(document.getElementById('year').value))) {

			document.getElementById("yearMsgErr").style.display = "block";
			return true;
			
			} else if ((id == 'year' || id == 'month' || id == 'day')
				&& !document.getElementById('month').value) {
			
			document.getElementById("monthMsgErr").style.display = "block";
			return true;

		} else if (document.getElementById('day').value.length < 3
				|| isNaN(parseInt(document.getElementById('day').value))) {
			
			document.getElementById("dayMsgErr").style.display = "block";
			return true;
			
		}
		
	// gender
	} else if (id == 'gender') {

		document.getElementById(id + "MsgNull").style.display = "none";
		
		if (!document.getElementById(id).value) {

			document.getElementById(id + "MsgNull").style.display = "block";
			return true;
			
		}
		
	// email
	} else if (id == 'email') {

		var regEmail = /^[a-zA-Z0-9]*@[0-9a-zA-Z]*(\.?[0-9a-zA-Z])*$/;
		
		document.getElementById(id + "MsgErr").style.display = "none";
		
		if (document.getElementById(id).value && !regEmail.test(document.getElementById(id).value)) {
			
			document.getElementById(id + "MsgErr").style.display = "block";
			return true;
			
		}

	// tel
	} else if (id == 'tel' || id == 'checkNum') {

		document.getElementById("telMsgNull").style.display = "none";
		document.getElementById("telMsgErr").style.display = "none";
		try {
			document.getElementById("checkNumMsgErr").style.display = "none";
		} catch (e) {
		}
		
		if(!document.getElementById('tel').value) {
				
			try {
				document.getElementById("checkNumMsgChe").style.display = "none";
			} catch (e) {
			}
			document.getElementById("telMsgNull").style.display = "block";
			return true;
			
		} else if (document.getElementById('tel').value.length != 11 || isNaN(parseInt(document.getElementById('tel').value))) {

			try {
				document.getElementById("checkNumMsgChe").style.display = "none";
			} catch (e) {
			}
			document.getElementById("telMsgErr").style.display = "block";
			return true;
			
		} else if (id == 'checkNum' && checkNum != document.getElementById('checkNum').value) {
			
			document.getElementById("checkNumMsgChe").style.display = "none";
			document.getElementById("checkNumMsgErr").style.display = "block";
			return true;
			
		}
	
	} else if (id == 'opwd') {

		var regOpwd = /^[a-zA-Z0-9]*$/;
		
		document.getElementById(id + "MsgNull").style.display = "none";
		document.getElementById(id + "MsgErr").style.display = "none";
		
		if (!document.getElementById(id).value) {
			
			document.getElementById(id + "MsgNull").style.display = "block";
			return true;
			
		} else if (document.getElementById(id).value.length < 8 || !regOpwd.test(document.getElementById(id).value)) {

			document.getElementById(id + "MsgErr").style.display = "block";
			return true;
			
		}

	}
	
	return false;

}

function write() {

	var result = true;

	if (check('checkNum')) {
		document.getElementById('checkNum').focus();
		result = false;
	}

	if (check('tel')) {
		document.getElementById('tel').focus();
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

	if (result) {
		alert("회원가입!")
		document.myForm.submit();
	}

}

function update() {
	
	var result = true;

	if (check('tel')) {
		document.getElementById('tel').focus();
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
	
	if (check('opwd')) {
		document.getElementById('opwd').focus();
		result = false;
	}

	if (result) {
		alert("수정완료!")
		document.myForm.submit();
	} else {
		alert("오류!")
	}

}
