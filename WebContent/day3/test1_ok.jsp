<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String name = request.getParameter("name");
	
	request.setAttribute("msg", "방가방가"); // request에 수동으로 넣어주면 object로 넘겨주기때문에 받을떄 다운캐스팅 해야한다. 
	
	response.sendRedirect("test1_result.jsp"); // 클라이언트에게 전달 - 리다이렉트
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%=name %>

</body>
</html>