<%@page import="com.util.MyPage"%>
<%@page import="java.util.List"%>
<%@page import="com.util.DBConn"%>
<%@page import="com.guest.GuestDAO"%>
<%@page import="com.guest.GuestDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	MyPage myPage = new MyPage();
	GuestDAO dao = new GuestDAO(DBConn.getConnection());
	
	String realPath = application.getRealPath("/");

	// MyPage에서 넘어온 pageNum
	String pageNum = request.getParameter("pageNum");
	int currentPage = 1;
	
	// 처음 실행을 검사
	if(pageNum != null) {
		currentPage = Integer.parseInt(pageNum);
	}
	
	// 전체 데이터 갯수 구하기
	int dataCount = dao.getDataCount();
	
	// 하나의 페이지에 보여줄 데이터 갯수(게시판에 게시물을 몇 개씩 보여줄 것인지)
	int numPerPage = 5;
	
	// 전체 페이지 갯수
	int totalPage = myPage.getPageCount(numPerPage, dataCount);
	
	// 삭제 시에 페이지 수가 줄었을 때 처리
	if(currentPage>totalPage){
		currentPage = totalPage;
	}
	
	// 데이터 베이스에서 가져올 rownum의 시작과 끝
	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;		
	
	List<GuestDTO> lists = dao.getListData(start, end);
	
	// 페이징 처리
	String listUrl = "guest.jsp";
	String pageIndexList =
			myPage.pageIndexList(currentPage, totalPage, listUrl);
	
	//글보기 주소
	String url = cp + "/guest/guest.jsp?pageNum=" + currentPage;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/board/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/board/css/created.css"/>

<script type="text/javascript" src="data/guest.js"></script>

</head>
<body>
	<div id="bbs">
		<div id="bbs_title">방 명 록(JSP)</div>
		<form action="" method="post" name="myForm">
			<div id="bbsCreated">
				
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>작&nbsp;성&nbsp;자</dt>
						<dd>
							<input type="text" name="name" size="35" maxlength="20" class="boxTF">
						</dd>
					</dl>
				</div>
				
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>&nbsp;E-mail</dt>
						<dd>
							<input type="text" name="email" size="35" maxlength="50" class="boxTF">
						</dd>
					</dl>
				</div>
				
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>홈페이지</dt>
						<dd>
							<input type="text" name="homepage" size="35" maxlength="50" class="boxTF" value="http://">
						</dd>
					</dl>
				</div>
				
				<div id="bbsCreated_content">
					<dl>
						<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
						<dd>
							<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
						</dd>
					</dl>
				</div>
				
				<div id="bbsCreated_footer" style="margin: 0px;">
					<input type="hidden" name="ipAddr" value="<%=realPath %>>"/>
					<input type="hidden" name="pageNum" value="<%=currentPage %>>"/>
					<input type="button" value="등록하기" class="btn2" onclick="sendIt();">
					<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.name.focus();">
				</div>
			</div>
			<%if (dao.getDataCount() == 0) {%>
				<div id="bbsCreated">
					<div class="bbsCreated_bottomLine">
						<div id="title">
							<dl>
								<dt class="num" style="width: 580px;"><b>등록 된자료가 없습니다.</b></dt>
							</dl>
						</div>
					</div>
				</div>
			<%} else { for(GuestDTO dto : lists) { %>
				<div id="bbsCreated">
					<div class="bbsCreated_bottomLine">
						<dl>
							<dt style="width: 580px;">
								<b>No <%=dto.getNum()%>. <%=dto.getName()%>(<%=dto.getEmail()%>)</b>
								<%if (dto.getHomepage().length() > 7) { %>
									<span style="float: right; padding-right: 10px">홈페이지 : <%=dto.getHomepage()%></span>
								<%} %>
							</dt>
							<dt style="width: 580px;">
								작성일 : <%=dto.getCreated()%> (<%=dto.getIpAddr()%>)
								<a onclick="return confirm('위 자료를 삭제하시겠습니까?')" 
								href="<%=cp%>/guest/delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>" style="float: right; padding-right: 10px;">삭제</a>
							</dt>
						</dl>
					</div>
					<div id="bbsCreated_footer" style="margin: 0px;">
						<dl>
							<dd><%=dto.getContent()%></dd>
						</dl>
					</div>
				</div>
			<%} }%>
				
			<div id="bbsCreated_footer">
				<p>
					<%=pageIndexList %>
				</p>
			</div>
				
		</form>
	</div>
</body>
</html>