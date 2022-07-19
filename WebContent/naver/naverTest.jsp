<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<jsp:useBean id="vo" class="com.naver.NaverVO"/>
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

id : <%=vo.getId()%><br/>
pwd : <%=vo.getPwd()%><br/>
name : <%=vo.getName()%><br/>
ymd : <%=vo.getYear()%>년 <%=vo.getMonth()%>월 <%=vo.getDay()%>일<br/>
birth : <%=vo.getBirth()%><br/>
email : <%=vo.getEmail()%><br/>
tel : <%=vo.getTel()%><br/>
tel_ : <%=vo.getTel_()%><br/>

</body>
</html>