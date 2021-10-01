<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String textParam = request.getParameter("textParam");
	String numberParam = request.getParameter("numberParam");
	String radioParam = request.getParameter("radioParam");
	String[] checkParam = request.getParameterValues("checkParam");
	String singleParam = request.getParameter("singleSelect");
	String[] multiSelect = request.getParameterValues("multiSelect");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sampleProcess.jsp</title>
</head>
<body>
<table>
	<tr>
		<th>textParam</th>
		<td><%=textParam %></td>
	</tr>
	<tr>
		<th>numberParam</th>
		<td><%=numberParam %></td>
	</tr>
	<tr>
		<th>checkParam</th>
		<td><%=checkParam %></td>
	</tr>
	<tr>
		<th>singleParam</th>
		<td><%=singleParam %></td>
	</tr>
	<tr>
		<th>multiSelect</th>
		<td><%=multiSelect %></td>
	</tr>
</table>
</body>
</html>