<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String eng = request.getParameter("eng");
	String han = request.getParameter("kor");
	
	String kor = URLDecoder.decode(han, "UTF-8"); // 압축해서 가져온 값을 풂
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
포워딩된 데이터<br/>
eng : <%=eng %><br/>
kor : <%=kor %><br/>

</body>
</html>