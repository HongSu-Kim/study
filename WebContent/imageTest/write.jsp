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
<link rel="stylesheet" type="text/css" href="<%=cp%>/boardTest/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/boardTest/css/created.css"/>
<script type="text/javascript">
	function sendIt() {
		var f = document.myForm;

		if (!f.subject.value) {
			alert("\n제목을 입력하세요.");
			f.subject.focus();
			return;
		}
		
		if (!f.upload.value) {
			alert("\파일을 선택하세요.");
			f.upload.focus();
			return;
		}
		
		f.action = "<%=cp%>/image/write_ok.do";
		f.submit();
		
	}
</script>

</head>
<body>
	<div id="bbs">
		<div id="bbs_title">이미지 게시판</div>
		<form action="" method="post" name="myForm" enctype="multipart/form-data">
			<div id="bbsCreated">
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
						<dd>
							<input type="text" name="subject" size="64" maxlength="100" class="boxTF">
						</dd>
					</dl>
				</div>
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>파&nbsp;&nbsp;&nbsp;&nbsp;일</dt>
						<dd>
							<input type="file" name="upload" size="64" maxlength="100" align="right">
						</dd>
					</dl>
				</div>
			</div>
			<div id="bbsCreated_footer">
				<input type="hidden" value="pageNum" name="pageNum">
				<input type="button" value="등록하기" class="btn2" onclick="sendIt();">
				<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.subject.focus();">
				<input type="button" value="작성취소" class="btn2" onclick="javascript:location.href='<%=cp%>/image/list.do';">
			</div>
		</form>
	</div>
</body>
</html>