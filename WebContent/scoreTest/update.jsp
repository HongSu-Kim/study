<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적처리 수정</title>

<style type="text/css">

body {
	 font-size: 9pt;
}

td {
	font-size: 9pt; 
}

.txtField {
	font-size: 9pt;
	border: 1px solid;
}

.btn {
	font-size: 9pt;
	background: #E6E6E6;
}

</style>

<script type="text/javascript">

	function sendIt() {
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/sung/update_ok.do";
		f.submit();
		
	}
</script>

</head>
<body>
	<br/><br/>
	<table width="500" cellpadding="0" cellspacing="3" align="center" bgcolor="#E4E4E4">
		<tr height="50">
			<td bgcolor="#FFFFFF" style="padding-left: 10px;">
				<b>성적처리 수정화면</b>
			</td>
		</tr>
	</table>
	<br/>
	<form action="" method="post" name="myForm">
		<table width="500" cellpadding="0" cellspacing="0" align="center">
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="30">
				<td align="center" width="100" bgcolor="#E6E6E6">학번</td>
				<td style="padding-left: 5px;">${dto.hak }</td>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="30">
				<td align="center" width="100" bgcolor="#E6E6E6">이름</td>
				<td style="padding-left: 5px;">${dto.name }</td>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="30">
				<td align="center" width="100" bgcolor="#E6E6E6">국어</td>
				<td style="padding-left: 5px;">
					<input type="text" name="kor" value="${dto.kor }"size="20" maxlength="3" class="txtField">
				</td>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="30">
				<td align="center" width="100" bgcolor="#E6E6E6">영어</td>
				<td style="padding-left: 5px;">
					<input type="text" name="eng" value="${dto.eng }"size="20" maxlength="3" class="txtField">
				</td>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="30">
				<td align="center" width="100" bgcolor="#E6E6E6">수학</td>
				<td style="padding-left: 5px;">
					<input type="text" name="mat" value="${dto.mat }"size="20" maxlength="3" class="txtField">
				</td>
			</tr>
			<tr height="2"><td colspan="2" bgcolor="#CCCCCC"></td></tr>
			<tr height="35">
				<td align="center" colspan="2">
					<input type="hidden" name="hak" value="${dto.hak }"/>
					<input type="button" class="btn" value="수정완료" onclick="sendIt();"/>
					<input type="button" class="btn" value="수정취소" onclick="javascript:location.href='<%=cp%>/sung/list.do';"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>