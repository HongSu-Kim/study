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

<link rel="stylesheet" type="text/css" href="<%=cp%>/imageTest/data/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/boardTest/css/list.css"/>

</head>
<body>
	<div id="bbsList">
		<div id="bbsList_title">이미지 게시판</div>
			<div id="bbsList_header">
				<div id="leftHeader">
					Total ${dataCount } articles ${totalPage } pages / Now page is ${currentPage }
				</div>
				<div id="rightHeader">
					<input type="button" value="글올리기" class="btn2" onclick="javascript:location.href='<%=cp%>/image/write.do';">
				</div>
			</div>
	
		<div id="bbsList_list">
			
			<div id="lists">
				<c:forEach var="dto" items="${lists }">
					<div style="display: inline-block;">
						<p><a><img src="${imagePath }/${dto.saveFileName }" width="220px" height="300"></a></p>
						<p>
							${dto.subject }
							<a href="${downloadPath }?num=${dto.num }">다운</a>
							<a href="${deletedPath }?num=${dto.num }">삭제</a>
						</p>
					</div>
				</c:forEach>
			</div>
			<div id="footer">
				<p>
					<c:if test="${dataCount != 0 }">
						${pageIndexList }
					</c:if>
					<c:if test="${dataCount == 0 }">
						등록된게시물이 없습니다.
					</c:if>
				</p>
			</div>
		</div>
	</div>
</body>
</html>