<%@page import="com.board.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.board.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<%
	String pageNum = request.getParameter("pageNum");

	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");

	String param = "";
	
	if (!searchValue.equals("")){

		param = "&searchKey=" + searchKey;
		param += "&searchValue=" + searchValue;
	}

	Connection conn = DBConn.getConnection();

	BoardDAO dao = new BoardDAO(conn);
	
	dao.updateData(dto);
	
	response.sendRedirect("list.jsp?pageNum=" + pageNum + param);
%>