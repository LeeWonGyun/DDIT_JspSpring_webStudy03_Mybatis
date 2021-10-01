<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>06/casheControl.jsp</title>
</head>
<body>
<h4>캐시 제어용 헤더</h4>
<pre>
	버전 하나에 맞추어 개발하면 안됨. 서버사이드에서 캐시를 남기지 않고자 한다면, 클라이언트의 버전이 무엇인지 모르니 다 써야한다.
	:Pragma(1.0), Cashe-Control(http 1.1) - 캐시 여부 결정
	, Expires(공통, 캐시 만료 시한)
	<%
// 		String cacheValue1 = "no-cache";
// 		String cacheValue2 = "no-store";
		String cacheValue1 = "public";

		response.setHeader("Pragma", cacheValue1);
		response.setHeader("Cache-Control", cacheValue1); 
// 		response.addHeader("Cache-Control", cacheValue2); //파이어폭스는 no-cache를 인식하지 못한다 => key가 같으니 덮어씌워진다. 추가하기 위해 바꾼다
		Calendar now = Calendar.getInstance();
		now.add(Calendar.DAY_OF_MONTH, 7);
		response.setDateHeader("Expires", now.getTimeInMillis()); //1970년0분0초 => 남기지않겠다!
	%>
</pre>
</body>
</html>