<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	Cookie c = new Cookie("productName3", URLEncoder.encode("LCDTV", "UTF-8"));

	c.setMaxAge(15);
	response.addCookie(c);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

잘보여 TV<br/>

<img alt="LCDTV" src="<%=cp %>/cookie/image/LCDTV.jpg"/><br/>

<a href="shop.jsp">돌아가기</a>

</body>
</html>