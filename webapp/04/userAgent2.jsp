<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/userAgent.jsp</title>
</head>
<body>
<h4>Uesr-Agent Header</h4>
<!-- 클라이언트의 브라우져가 크롬이면 -> 당신의 브라우져는 크롬입니다 -->
<!-- 클라이언트의 브라우져가 엣지면 -> 당신의 브라우져는 엣지입니다. -->
<!-- 클라이언트의 브라우져가 사파리 -> 당신의 브라우져는 사파리입니다. -->
<%
	String agent = request.getHeader("User-Agent");	
	agent = agent.toUpperCase();
	String browserName = null;
	if(agent.contains("EDG")){
		browserName = "엣지";
	}else if(agent.contains("CHROME")){
		browserName = "크롬";
	}else if(agent.contains("SAFARI")){
		browserName = "사파리";
	}else{
		browserName = "기타";
	}
	
	String pattern = "당신의 브라우저는 %s입니다!";
	String message = String.format(pattern,browserName);
	
%>
<%= agent %>
<script>
	alert("<%=message%>");
</script>		
</body>
</html>