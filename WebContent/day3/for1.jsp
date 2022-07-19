<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//request.setCharacterEncoding("UTF-8"); // post/get 방식으로 값을 받을때 인코딩함
	String cp = request.getContextPath();

	String eng = "test";
	String kor = "테스트";
	
	String han = URLEncoder.encode(kor, "UTF-8"); // 한글을 압측해서 안깨지게 함
	
%>
<jsp:forward page="for2.jsp">
	<jsp:param value="<%=eng %>" name="eng"/>
	<jsp:param value="<%=han %>" name="kor"/>
</jsp:forward>