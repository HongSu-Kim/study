<%@ page contentType="text/html; charset=UTF-8"%>
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

<h1>메인 페이지</h1>
1. <a href="<%=cp%>/score/list.jsp">성적처리 게시판(SCORE) - JSP</a><br/>
2. <a href="<%=cp%>/naver/list.jsp">네이버 회원관리(NAVER) - JSP</a><br/>
3. <a href="<%=cp%>/board/list.jsp">게시판(BOARD) - JSP</a><br/>
4. <a href="<%=cp%>/guest/guest.jsp">방명록(GUEST) - JSP</a><br/>





-. <a href="http://localhost:8080/hong/HBbs/main.jsp">게시판(HBBS) - JSP</a><br/>

</body>
</html>