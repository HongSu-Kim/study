<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String userId = (String)session.getAttribute("userId");
	
	session.setMaxInactiveInterval(10 * 60);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<script type="text/javascript">
	function sendIt() {
		var f = document.myForm;
		
		if (!f.userId.value) {
			alert("아이디 입력!");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value) {
			alert("패스워드 입력!");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
		
	}
</script>


</head>
<body>
<br/>
<br/>
	<table border="1" width="600" cellpadding="0" cellspacing="0" align="center">
		<tr height="20">
			<td colspan="2" align="right">
				|게시판|
				<%if (userId == null) {%>
					일정관리
				<%} else {%>
					<a href="schedule.jsp">일정관리</a>
				<%} %>
			</td>
		</tr>
		<tr height="400">
			<td width="200" valign="top">
			<%if (userId == null) {%>
				<form action="login_ok.jsp" method="post" name="myForm">
					아이디: <input type="text" name="userId" size="10"/><br/>
					패스워드: <input type="password" name="userPwd" size="10"/><br/>
					<input type="button" value="로그인" onclick="sendIt();"/>
				</form>
			<%} else {%>
				<%=userId %>님 방가방가.<br/><br/>
				<a href="logout.jsp">로그아웃</a>
			<%} %>
			</td>
			<td valign="middle" align="center">
				<%if (userId == null) {%>
					<b>로그인하면 새로운 새상이 보입니다.</b>
				<%} else {%>
					<jsp:include page="../day2/calendar4.jsp"/>
				<%} %>
			</td>
		</tr>
	</table>
</body>
</html>