<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	session.removeAttribute("userId"); // userId 변수값 삭제
	session.invalidate(); // userId 변수삭제
	
	response.sendRedirect("login.jsp");
%>