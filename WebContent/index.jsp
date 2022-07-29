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
<title>Insert title here</title>

<script type="text/javascript">
	
	//var userAgent = navigator.userAgent;
	//alert(userAgent);
	
	var smartPhones = [
		'iphone','android','ipod','windows ce','blackberry','nokia','webos',
		'opera mini','sonyericsson','opera mobi'
	];
	
	for(var i in smartPhones){
		
		if(navigator.userAgent.toLowerCase().match(new RegExp(smartPhones[i]))){
			alert('어머 이건 스마트 폰이네...');
			document.location = 'http://m.naver.com';
		}
	}	
	
</script>

</head>
<body>

	<c:choose>
		<c:when test="${empty sessionScope.customInfo.userId }">
			<b>로그인하면 새로운 화면이 보입니다.</b><br/><br/>
		</c:when>
		<c:otherwise>
			<b>${sessionScope.customInfo.userName }</b>님 방가방가<br/><br/>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${empty sessionScope.customInfo.userId }">
			1.성적처리 게시판(SCORE) - JSP<br/>
			2.네이버 회원관리(NAVER) - JSP<br/>
			3.방명록(GUEST) - JSP<br/>
			4.성적처리(SCORE) - SERVLET<br/>
		</c:when>
		<c:otherwise>
			1. <a href="<%=cp%>/score/list.jsp">성적처리(SCORE) - JSP</a><br/>
			2. <a href="<%=cp%>/board/list.jsp">게시판(BOARD) - JSP</a><br/>
			3. <a href="<%=cp%>/guest/guest.jsp">방명록(GUEST) - JSP</a><br/>
			4. <a href="<%=cp%>/sung/list.do">성적처리(SCORE) - SERVLET</a><br/>
		</c:otherwise>
	</c:choose>

	5. <a href="<%=cp%>/bbs/list.do">게시판(BOARD) - SERVLET</a><br/>
	6. <a href="<%=cp%>/image/list.do">이미지 게시판(IMAGETEST) - SERVLET</a><br/>
	
	<br/><hr/><br/>
	
	<c:choose>
		<c:when test="${empty sessionScope.customInfo.userId }">
			<a href="<%=cp%>/join/created.do">회원가입</a><br/>
			<a href="<%=cp%>/join/login.do">로그인</a><br/>
		</c:when>
		<c:otherwise>
			<a href="<%=cp%>/join/updated.do">정보수정</a><br/>
			<a href="<%=cp%>/join/logout_ok.do">로그아웃</a><br/>
		</c:otherwise>
	</c:choose>
	
	<br/><hr/><br/>
	<h3>hong</h3>
	1. <a href="<%=cp%>/naver/list.jsp">네이버 회원관리(NAVER) - JSP</a><br/>
	2. <a href="/hong/HBBS/main/main.do">게시판(HBBS) - SERVLET</a><br/>

</body>
</html>