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
<title>회원 정보 수정</title>

<link rel="stylesheet" type="text/css" href="<%=cp%>/member/css/style.css"/>
<link rel="stylesheet" type="text/css" href="<%=cp%>/member/css/created.css"/>

<script type="text/javascript" src="<%=cp%>/member/js/util.js"></script>
<script type="text/javascript">
	function sendIt() {
		var f = document.myForm;

		
		if (!f.userPwd.value) {
			alert("패스워드를 입력하세요");
			f.userPwd.focus();
			return;
		}
		
		if (!f.userBirth.value) {
			alert("생일를 입력하세요");
			f.userBirth.focus();
			return;
		}
		
		if (!f.userTel.value) {
			alert("전화번호를 입력하세요");
			f.userTel.focus();
			return;
		}
		
		f.action = "<%=cp%>/join/updated_ok.do";
		f.submit();

	}

</script>

</head>
<body>
	<div id="bbs">
		<div id="bbs_title">회원 정보 수정</div>
		<form action="" method="post" name="myForm">
			<div id="bbsCreated">
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>아&nbsp;이&nbsp;디</dt>
						<dd>${dto.userId }</dd>
					</dl>
				</div>
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>이&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
						<dd>${dto.userName }</dd>
					</dl>
				</div>
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>패스워드</dt>
						<dd>
							<input type="password" name="userPwd" size="35" class="boxTF">
						</dd>
					</dl>
				</div>
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>생&nbsp;&nbsp;&nbsp;&nbsp;일</dt>
						<dd>
							<input type="text" name="userBirth" size="35" class="boxTF">[YYYY-MM-DD]
						</dd>
					</dl>
				</div>
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>전화번호</dt>
						<dd>
							<input type="text" name="userTel" size="35" class="boxTF">
						</dd>
					</dl>
				</div>
			</div>
			<div id="bbsCreated_footer">
				<input type="hidden" name="userId" value="${dto.userId }">
				<input type="hidden" name="userName" value="${dto.userName }">
				<input type="button" value="수정하기" class="btn2" onclick="sendIt();">
				<input type="button" value="수정취소" class="btn2" onclick="location.href='<%=cp%>';">
			</div>
		</form>
	</div>
</body>
</html>