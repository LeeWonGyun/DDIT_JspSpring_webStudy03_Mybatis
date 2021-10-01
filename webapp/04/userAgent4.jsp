<%@page import="kr.or.ddit.enumpkg.BrowserType"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
	browserName = BrowserType.OTHER.getBrowserName();
	for(BrowserType tmp : BrowserType.values()){
		String key = tmp.name();
		if(agent.contains(key)){
			browserName = tmp.getBrowserName();
			break;
		}
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