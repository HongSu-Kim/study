<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

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
	if (preMonth < 1) {
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
<title>만년 달력</title>

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
</style>

<script type="text/javascript">
	function changeMonth(val) {
		var f = document.myForm;
		var s;
		var year1 = <%=year%>;
		var month1 = <%=month%>;

		if (val == 'year') {
			s = f.year;
		} else {
			s = f.month;
		}

		for (var i = 0; i < s.length; i++) {
			if (s.options[i].selected) {
				if (val == 'year') {
					year1 = s.options[i].value
				} else {
					month1 = s.options[i].value;
				}
			}
		}
		
		f.action = "calendar2.jsp?year=" + year1 + "&month=" + month1;
		f.submit();

	}
</script>

</head>
<body>
	<br />
	<br />
	<form action="" method="get" name="myForm">
		<table align="center" width="210pt;" cellpadding="2" cellspacing="1">
			<tr>
				<td align="center">
				<a href="calendar2.jsp"><img alt="today"src="./image/today.png" align="left" height="18pt"></a>
				<a href="calendar2.jsp?year=<%=preYear%>&month=<%=preMonth%>">◀</a> 
				<select name="year" onchange="changeMonth('year')">
						<%
							for (int i = year - 5; i <= year + 5; i++) {
								if (i != year)
									out.print("<option value='" + i + "'>" + i + "</option>");
								else
									out.print("<option value='" + i + "' selected='selected'>" + i + "</option>");
							}
						%>
				</select>년&nbsp;
				<select name="month" onchange="changeMonth('month')">
						<%
							for (int i = 1; i <= 12; i++) {
								if (i != month)
									out.print("<option value='" + i + "'>" + i + "</option>");
								else
									out.print("<option value='" + i + "' selected='selected'>" + i + "</option>");
							}
						%>
				</select>월 <a href="calendar2.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">▶</a>
				</td>
			</tr>
		</table>
		<table align="center" width="210pt;" cellpadding="0" cellspacing="1"
			bgcolor="#CCCCCC">
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

					out.print("<td align='center' bgcolor='" + bgColor + "'>"
						+ "<font color='" + fontColor + "'>" + i + "</font></td>");
					//out.print("<td align='center' bgcolor='bgColor'><font color='fontColor'>i</font></td>");

					newLine++;

					if (newLine == 7 && i != endDay) {
						out.print("</tr><tr height='20'>");
						newLine = 0;
					}

				}

				while (newLine > 0 && newLine < 7) {
					out.print("<td bgcolor='#FFFFFF'>&nbsp;</td>");
					newLine++;
				}

				out.print("</tr>");
			%>
		</table>
	</form>
</body>
</html>