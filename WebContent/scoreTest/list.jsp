<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
	 font-size: 9pt;
}

td {
	font-size: 9pt;
}

.btn {
	font-size: 9pt;
	background: #E6E6E6;
}

a {
	text-decoration: none;
	color: blue
}

</style>

</head>
<body>
	<br/><br/>
	<table width="700" cellpadding="0" cellspacing="3" align="center" bgcolor="#E4E4E4">
		<tr height="50">
			<td bgcolor="#FFFFFF" style="padding-left: 10px;">
				<b>성적처리 리스트 화면</b>
			</td>
		</tr>
	</table>
	<br/>
	<table width="650" cellpadding="0" cellspacing="1" align="center">
		<tr height="35">
			<td align="right">
				<input type="button" class="btn" value="등록하기" onclick="location='<%=cp%>/sung/write.do';">
			</td>
		</tr>
	</table>
	<table width="650" cellpadding="0" cellspacing="1" align="center" bgcolor="#CCCCCC">
		<tr height="30">
			<td align="center" bgcolor="#E6E6E6" width="60">학번</td>
			<td align="center" bgcolor="#E6E6E6" width="60">이름</td>
			<td align="center" bgcolor="#E6E6E6" width="60">국어</td>
			<td align="center" bgcolor="#E6E6E6" width="60">영어</td>
			<td align="center" bgcolor="#E6E6E6" width="60">수학</td>
			<td align="center" bgcolor="#E6E6E6" width="60">총점</td>
			<td align="center" bgcolor="#E6E6E6" width="60">평균</td>
			<td align="center" bgcolor="#E6E6E6" width="60">석차</td>
			<td align="center" bgcolor="#E6E6E6" width="130">수정</td>
		</tr>
	<c:forEach var="dto" items="${lists }">
		<tr height="30">
			<td align="center" bgcolor="#FFFFFF">${dto.hak }</td>
			<td align="center" bgcolor="#FFFFFF">${dto.name }</td>
			<td align="center" bgcolor="#FFFFFF">${dto.kor }</td>
			<td align="center" bgcolor="#FFFFFF">${dto.eng }</td>
			<td align="center" bgcolor="#FFFFFF">${dto.mat }</td>
			<td align="center" bgcolor="#FFFFFF">${dto.tot }</td>
			<td align="center" bgcolor="#FFFFFF">${dto.ave }</td>
			<td align="center" bgcolor="#FFFFFF">${dto.rank }</td>
			<td align="center" bgcolor="#FFFFFF">
				<a href="<%=cp%>/sung/update.do?hak=${dto.hak }">수정</a>
				<a href="<%=cp%>/sung/delete_ok.do?hak=${dto.hak }">삭제</a>
			</td>
		</tr>
	</c:forEach>
	
	</table>
	
</body>
</html>