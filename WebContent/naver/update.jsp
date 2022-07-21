<%@page import="com.naver.NaverDTO"%>
<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String id = request.getParameter("id");
	
	Connection conn = DBConn.getConnection();
	NaverDAO dao = new NaverDAO(conn);
	
	NaverDTO dto = dao.getReadData(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 : 회원정보 수정</title>

<link href="./naverImage/naver_icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="naverStyle.css">

<script type="text/javascript" src="naverScript.js"></script>
<script type="text/javascript">
	function selected() {
		
		var f = document.myForm;
		var month = f.month;
		var gender = f.gender;
	
		for (i = 0; i < 12; i++){
			if (month[i].value == <%=dto.getMonth()%>) {
				month[i].selected = true;
			}
		}
	
		for (i = 0; i < 4; i++){
			if (gender[i].value == "<%=dto.getGender()%>") {
				gender[i].selected = true;
			}
		}
		
	}
</script>

</head>
<body onload="selected();">
	<form action="<%=cp%>/naver/update_ok.jsp" method="post" name="myForm">
		<div align="center" style="width: 460px; padding-top: 60px; margin: auto;">
			<div class="row">
				<a href="https://www.naver.com/"><img alt="NAVER" src="./naverImage/naver.png"></a>
			</div>
			
			<div class="row">
				<h4 class="head"><label for="id">아이디</label></h4>
				<p class="box" id="idBox">
					<input type="text" id="id" name="id" maxlength="20" value="<%=dto.getId()%>" readonly="readonly"/>
					<span style="float: right; color: #8E8E8E;">@naver.com</span>
				</p>
			</div>
	
			<div class="row">
				<h4 class="head"><label for="opwd">기존 비밀번호</label></h4>
				<p class="box" id="opwdBox" onclick="inputFocus('opwd')">
					<input type="password" id="opwd" name="opwd" maxlength="16" onblur="check(this.id)" onfocus="inputHighlight(this.id)"/>
				</p>
				<p class="msg">
					<span id="opwdMsgNull" style="display: none;">필수정보입니다.</span>
					<span id="opwdMsgErr" style="display: none;">8~16자의 영문 대 소문자, 숫자만 사용 가능합니다.</span>
				</p>
			</div>
			
			<div class="row">
				<h4 class="head"><label for="pwd">비밀번호</label></h4>
				<p class="box" id="pwdBox" onclick="inputFocus('pwd')">
					<input type="password" id="pwd" name="pwd" value="<%=dto.getPwd()%>" maxlength="16" onblur="check(this.id)" onfocus="inputHighlight(this.id)"/>
					<img alt="pwd1" src="./naverImage/pwd1.png" class="relativeImage" width="21px" align="right">
					<img alt="pwd2" src="./naverImage/pwd2.png" class="relativeImage" id="pwd2Image" style="display: none; left: 21px" width="21px" align="right">
					<img alt="pwd3" src="./naverImage/pwd3.png" class="relativeImage" id="pwd3Image" style="display: none; left: 21px" width="21px" align="right">
					<span class="relativeText" id="pwd2Text" style="color: #00C850;">안전</span>
					<span class="relativeText" id="pwd3Text" style="color: #FF0000;">사용불가</span>
				</p>
				<p class="msg">
					<span id="pwdMsgNull" style="display: none;">필수정보입니다.</span>
					<span id="pwdMsgErr" style="display: none;">8~16자의 영문 대 소문자, 숫자만 사용 가능합니다.</span>
				</p>
			</div>
	
			<div class="row">
				<h4 class="head"><label for="pwdc">비밀번호 재확인</label></h4>
				<p class="box" id="pwdcBox" onclick="inputFocus('pwdc')">
					<input type="password" id="pwdc" value="<%=dto.getPwd()%>" maxlength="16" onblur="check(this.id)" onfocus="inputHighlight(this.id)"/>
					<img alt="pwdc1" src="./naverImage/pwdc1.png" class="relativeImage" width="21px" align="right">
					<img alt="pwdc2" src="./naverImage/pwdc2.png" class="relativeImage" id="pwdc2Image" style="display: none; left: 21px" width="21px" align="right">
				</p>
				<p class="msg">
					<span id="pwdcMsgNull" style="display: none;">필수정보입니다.</span>
					<span id="pwdcMsgErr" style="display: none;">비밀번호가 일치하지 않습니다.</span>
				</p>
			</div>
	
			<div class="row">
				<h4 class="head"><label for="name">이름</label></h4>
				<p class="box" id="nameBox" onclick="inputFocus('name')">
					<input type="text" id="name" name="name" value="<%=dto.getName()%>" onblur="check(this.id)" onfocus="inputHighlight(this.id)"/>
				</p>
				<p class="msg">
					<span id="nameMsgNull" style="display: none;">필수정보입니다.</span>
					<span id="nameMsgErr" style="display: none;">한글 또는 영문만 사용하세요.(특수기호, 공백 사용 불가)</span>
				</p>
			</div>
	
			<div class="row">
				<h4 class="head"><label for="year">생년월일</label></h4>
				<p style="margin: 0px">
					<span class="box box3 leftBox" id="yearBox" style="float: left;" onclick="inputFocus('year')">
						<input type="text" id="year" name="year" value="<%=dto.getYear()%>" maxlength="4" style="width: 85px; position: relative;" onblur="check(this.id)" onfocus="inputHighlight(this.id)"/>
					</span>
					<span class="box box3" id="monthBox" onclick="inputFocus('month')">
						<select class="monthSel" id="month" name="month" onblur="check(this.id)" onfocus="inputHighlight(this.id)">
							<option value="">월</option>
							<option value="01">01</option>
							<option value="02">02</option>
							<option value="03">03</option>
							<option value="04">04</option>
							<option value="05">05</option>
							<option value="06">06</option>
							<option value="07">07</option>
							<option value="08">08</option>
							<option value="09">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</span>
					<span class="box box3 rigthBox" id="dayBox" style="float: right;" onclick="inputFocus('day')">
						<input type="text" id="day" name="day" value="<%=dto.getDay()%>" maxlength="2" style="width: 85px; position: relative;" onblur="check(this.id)" onfocus="inputHighlight(this.id)"/>
					</span>
				</p>
				<p class="msg">
					<span id="yearMsgErr" style="display: none;">태어난 년도 4자리를 정확하게 입력하세요.</span>
					<span id="monthMsgErr" style="display: none;">태어난 월을 선택하세요.</span>
					<span id="dayMsgErr" style="display: none;">태어난 일(날짜) 2자리를 정확하게 입력하세요.</span>
					<span id="birthMsgErr1" style="display: none;">생년월일을 다시 확인해주세요.</span>
					<span id="birthMsgErr2" style="display: none;">정말이세요?</span>
				</p>
			</div>
			
			<div class="row">
				<h4 class="head"><label for="gender">성별</label></h4>
				<p class="box" id="genderBox" onclick="inputFocus('gender')">
					<select class="tel1Sel" id="gender" name="gender" onblur="check(this.id)" onfocus="inputHighlight(this.id)">
						<option value="">성별</option>
						<option value="남자">남자</option>
						<option value="여자">여자</option>
						<option value="선택안함">선택안함</option>
					</select>
				</p>
				<p class="msg">
					<span id="genderMsgNull" style="display: none;">필수정보입니다.</span>
				</p>
			</div>
	
			<div class="row">
				<h4 class="head"><label for="email">본인 확인 이메일</label><a style="font-size: 12px; color: gray;">(선택)</a></h4>
				<p class="box" id="emailBox" onclick="inputFocus('email')">
					<input type="text" id="email" name="email" onblur="check(this.id)" onfocus="inputHighlight(this.id)"/>
				</p>
				<p class="msg">
					<span id="emailMsgErr" style="display: none;">이메일 주소를 다시 확인해주세요.</span>
				</p>
			</div>
	
			<div class="row">
				<h4 class="head"><label for="tel1">휴대전화</label></h4>
				<p class="box" id="tel1Box" onclick="inputFocus('tel1')">
					<select class="tel1Sel" id="tel1" onblur="check(this.id)" onfocus="inputHighlight(this.id)">
						<option>네덜란드 +31</option>
						<option selected="selected">대한민국 +82</option>
						<option>미국/캐나다 +1</option>
						<option>일본 +81</option>
						<option>중국 + 86</option>
						<option>프랑스 +33</option>
					</select>
				</p>
				<p>
					<span class="box" id="telBox" onclick="inputFocus('tel')">
						<input type="text" id="tel" name="tel" value="<%=dto.getTel()%>" align="left" maxlength="11" onblur="check(this.id)" onfocus="inputHighlight(this.id)">
					</span>
				</p>
			
				<p class="msg">
					<span id="telMsgNull" style="display: none;">필수정보입니다.</span>
					<span id="telMsgErr" style="display: none;">형식에 맞지 않는 번호입니다.</span>
				</p>
			</div>
			
			<div class="row" style="margin-top: 30px;">
				<a href="javascript:update();" class="button box3 btn3" style="float: left;"><b>수정완료</b></a>
				<a href="http://localhost:8080/study/naver/update.jsp?id=asdasd" class="button box3 btn3" style=""><b>다시입력</b></a>
				<a href="<%=cp %>/naver/list.jsp" class="button box3 btn3" style="float: right;"><b>취소</b></a>
			</div>
			
			<div>
				<p>
					<a href="https://policy.naver.com/rules/service.html" class="atag">이용약관</a> <img alt="bar" src="./naverImage/bar.png" height=12px;/> 
					<a href="https://policy.naver.com/policy/privacy.html" class="atag"><b>개인정보처리방침</b></a> <img alt="bar" src="./naverImage/bar.png" height=12px;/> 
					<a href="https://policy.naver.com/rules/disclaimer.html" class="atag">책임의 한계와 법적고지</a> <img alt="bar" src="./naverImage/bar.png" height=12px;/> 
					<a href="https://help.naver.com/support/service/main.help?serviceNo=532&_membership_p.membership_p.membership_26&from=alias"  class="atag" target="_blank">회원정보 고객센터</a>
				</p>
				<p style="font-size: 12px;">
					<a><img alt="naver" src="./naverImage/naver.png" height="15px"></a> 
					Copyright <a href="https://www.navercorp.com/" class="atag"><b>NAVER Corp.</b></a> All Rights Reserved.
				</p>
			</div>
		</div>
	</form>
</body>
</html>