<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String userId = (String)session.getAttribute("userId");
	
	session.setMaxInactiveInterval(10 * 60);
	
	Calendar cal = Calendar.getInstance();
	
	// 오늘날짜
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH) + 1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	// 클라이언트가 넘긴 데이터
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	// 달력에 표시할 년, 월
	int year = nowYear;
	int month = nowMonth;
	
	if (strYear != null) {
		year = Integer.parseInt(strYear);
	}
	if (strMonth != null) {	
		month = Integer.parseInt(strMonth);
	}
	
	int preYear = year, preMonth = month - 1;
	if (preMonth < 1){
		preYear--;
		preMonth = 12;
	}
	
	int nextYear = year, nextMonth = month + 1;
	if (nextMonth > 12) {
		nextYear++;
		nextMonth = 1;
	}
	
	// 표시할 달력
	cal.set(year, month - 1, 1);
	int startDay = 1;
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	//year년 month월 1일의 요일
	int week = cal.get(Calendar.DAY_OF_WEEK);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<style type="text/css">

body {
	font-size: 10pt;
}

td {
	font-size: 10pt;
}

a {
	text-decoration: none;
	color: blue;
}

select {
	font-size: 15pt;
}

</style>

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
	
	function init() {
	
		var f = document.myForm;

		var fyear = f.year;
		var nowYear = <%=year%>;
		var startYear = nowYear - 5;
		
		for (i = 0; i < 11; i++){
			fyear[i] = new Option(startYear, startYear);
			if (fyear[i].value == nowYear) {
				fyear[i].selected = true;
			}
			startYear++;
		}
		
		var fmonth = f.month;
		
		for (i = 0; i < 12; i++){
			fmonth[i] = new Option(i + 1, i + 1);
		}
		
		var nowMonth = <%=month%>;
		fmonth[nowMonth -1].selected = true;
		
	}

	function calendarChange() {

		var f = document.myForm;
		f.submit();
	}	
</script>

</head>
<body onload="init()">
	<br/><br/>
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
					<form action="" method="get" name="myForm">
						<table align="center" width="210pt;"cellpadding="2" cellspacing="1" >
							<tr>
								<td align="center">
									<a href="./login.jsp"><img alt="today" src="../day2/image/today.png" align="left" height="18pt"></a>
								</td>
								<td style="font-size:  9pt;">
									<b>&nbsp;
										<select name="year" onchange="calendarChange()"></select>년&nbsp;&nbsp;
										<select name="month" onchange="calendarChange()"></select>월
									</b>
								</td>
							</tr>
						</table>
						<table align="center" width="210pt;"cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
							<tr>
								<td bgcolor="#E6E4E6" align="center"><font color="red">일</font></td>
								<td bgcolor="#E6E4E6" align="center">월</td>
								<td bgcolor="#E6E4E6" align="center">화</td>
								<td bgcolor="#E6E4E6" align="center">수</td>
								<td bgcolor="#E6E4E6" align="center">목</td>
								<td bgcolor="#E6E4E6" align="center">금</td>
								<td bgcolor="#E6E4E6" align="center"><font color="blue">토</font></td>
							</tr>
							<%
								int newLine = 0;
								
								out.print("<tr height='20'>");
								
								for (int i = 1; i < week; i++) {
									out.print("<td bgcolor='#FFFFFF'>&nbsp;</td>");
									newLine++;
								}
								
								for (int i = startDay; i <= endDay; i++) {
									
									String fontColor = (newLine == 0) ? "red" : (newLine == 6) ? "blue" : "black";
									String bgColor = (nowYear == year) && (nowMonth == month) && (nowDay == i) ? "#E6E4E6" : "#FFFFFF";
						
									out.print("<td align='center' bgcolor='" + bgColor + "'><font color='" + fontColor + "'>" + i + "</font></td>");
									//out.print("<td align='center' bgcolor='bgColor'><font color='fontColor'>i</font></td>");
									
									newLine++;
									
									if (newLine == 7 && i != endDay) {
										out.print("</tr><tr height='20'>");
										newLine = 0;
									}
									
								}
								
								while(newLine > 0 && newLine <7) {
									out.print("<td bgcolor='#FFFFFF'>&nbsp;</td>");
									newLine++;
								}
								
								out.print("</tr>");
							%>
						</table>
					</form>
				<%} %>
			</td>
		</tr>
	</table>
</body>
</html>