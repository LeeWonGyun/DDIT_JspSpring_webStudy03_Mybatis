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
		String browser = request.getHeader("sec-ch-ua");	
		int chrome = browser.indexOf("Chrome");	
		int edge = browser.indexOf("Edge");	
		int safari = browser.indexOf("Safari");	

		if(chrome != -1){
	%>
			<script>
			alert("당신의 브라우져는 크롬입니다.");
			</script>
	<% 
		}else{
	%>
			<script>
			alert("당신의 브라우져는 엣지입니다.");
			</script>
	<%
		}
		System.out.println(chrome);
		System.out.println(edge);
		System.out.println(safari);
	%>
</body>
</html>