<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/boardTest/css/style.css"/>

<script type="text/javascript" src="<%=cp%>/member/js/util.js"></script>
<script type="text/javascript">
	function searchpw() {
		var f = document.myForm;

		if (!f.userId.value) {
			alert("아이디를 입력하세요!")
			f.userId.focus();
			return;
		}
		
		if (!f.userTel.value) {
			alert("전화번호를 입력하세요!")
			f.userTel.focus();
			return;
		}
		
		f.action = "<%=cp%>/join/searchpw_ok.do";
		f.submit();
		
	}
</script>

</head>
<body>
	<br/><br/>
	<form action="" method="post" name="myForm">
		<table align="center" cellpadding="0" cellspacing="0" style="margin: auto;">
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="30">
				<td colspan="2" align="center"><b>비밀번호 찾기</b></td>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr>
				<td width="80" bgcolor="#E6E4E6" align="center">아이디</td>
				<td width="120" style="padding-left: 5px">
				<input type="text" name="userId" maxlength="10" size="15"/>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr>
				<td width="80" bgcolor="#E6E4E6" align="center">전화번호</td>
				<td width="120" style="padding-left: 5px">
				<input type="text" name="userTel" maxlength="10" size="15"/>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="30">
				<td colspan="2" align="center">
					<input type="button" value="확인" class="btn2" onclick="searchpw();"/>
					<input type="button" value="취소" class="btn2" onclick="location='<%=cp%>/join/login.do';"/>
				</td>
			</tr>
			<tr height="30">
				<td colspan="2" align="center">
					<font color="red"><b>${message }</b></font> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>