<%@page import="com.naver.NaverDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.naver.NaverDAO"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	NaverDAO dao = new NaverDAO(DBConn.getConnection());
	
	List<NaverDTO> lists = dao.getLists();
	DBConn.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 : 회원관리</title>

<link href="./naverImage/naver_icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="naverStyle.css">

</head>
<body>
	<div align="center" style="width: 100%; background-color: #00C73C; margin: auto; ">
		<div class="row-list" align="left">
			<a href="https://www.naver.com/"><img alt="NAVER" src="./naverImage/naver1.png" height="13px;"></a>
			<b style="background: none; color: #FFFFFF; font-size: 25px;">네이버 : 회원관리</b>
		</div>
	</div>
	<div align="center">
		<div class="row-list" style="padding-top: 30px; padding-bottom: 10px;">
			<span>
				<a href="<%=cp%>/naver/write.jsp" class="button btn" style="float: right;">등록하기</a>
			</span>
		</div>
		<table width="800" cellpadding="0" cellspacing="1" align="center" bgcolor="#CCCCCC">
			<tr height="30">
				<td align="center" bgcolor="#E6E6E6" width="60">아이디</td>
				<td align="center" bgcolor="#E6E6E6" width="60">패스워드</td>
				<td align="center" bgcolor="#E6E6E6" width="60">이름</td>
				<td align="center" bgcolor="#E6E6E6" width="60">생일</td>
				<td align="center" bgcolor="#E6E6E6" width="60">성별</td>
				<td align="center" bgcolor="#E6E6E6" width="60">이메일</td>
				<td align="center" bgcolor="#E6E6E6" width="60">전화번호</td>
				<td align="center" bgcolor="#E6E6E6" width="60">수정/삭제</td>
			</tr>
		<%for(NaverDTO dto : lists) {%>
		<tr height="30">
			<td align="center" bgcolor="#FFFFFF"><%=dto.getId()%></td>
			<td align="center" bgcolor="#FFFFFF"><%=dto.getPwd()%></td>
			<td align="center" bgcolor="#FFFFFF"><%=dto.getName()%></td>
			<td align="center" bgcolor="#FFFFFF"><%=dto.getYear()%>-<%=dto.getMonth()%>-<%=dto.getDay()%></td>
			<td align="center" bgcolor="#FFFFFF"><%=dto.getGender()%></td>
			<td align="center" bgcolor="#FFFFFF"><%=dto.getEmail()%></td>
			<td align="center" bgcolor="#FFFFFF"><%=dto.getTel()%></td>
			<td align="center" bgcolor="#FFFFFF">
				<a href="<%=cp%>/naver/update.jsp?id=<%=dto.getId()%>">수정</a>
				<a href="<%=cp%>/naver/delete_ok.jsp?id=<%=dto.getId()%>">삭제</a>
			</td>
		</tr>
		<%}%>
		</table>
		<div style="margin-top: 30px;">
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
</body>
</html>