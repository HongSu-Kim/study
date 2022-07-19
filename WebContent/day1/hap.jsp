<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--
	MIME [Multipurpose Internet Mail Extensions]의 종류
	메세지의 내용이 어떤 형식인지 알려주기위해 정의한 인터넷 표준
	
	text/plain : 일반 텍스트문서
	text/html : HTML 문서 
	text/css  :CSS 문서
	text/xml : XML 문서
	image/jpeg,image/png : JPEG파일, PNG파일 
	video/mpeg,audio/mp3 : MPEG 비디오파일, MP3 음악파일
	application/zip : zip 압축파일
	-->

	<!-- hap_pk.jsp?su1=11&su2=22 : get방식, 데이터 보임(프로그래머가 사용하는 데이터들) -->
	<!-- hap_pk.jsp : post방식, 데이터 안보임(사용자가 입력한 정보들) -->
	<!-- request객체에 담아서 넘김 -->
	<!-- post방식에서 한글을 넘겨주면 깨짐 -->
	<form action="hap_ok.jsp" method="post">
	
		수1: <input type="text" name="su1"/><br/>
		수2: <input type="text" name="su2"/><br/>
		이름: <input type="text" name="name"><br/>
		<!-- submt : action을 찾아감 -->
		<input type="submit" value="결과"/>

	</form>
	
	<!-- 한글을 넣으면 오류날수도있음 -->
	<a href="hap_ok.jsp?su1=100&su2=200&name=수지">GET방식</a>





</body>
</html>