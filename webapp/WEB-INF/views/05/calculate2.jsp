<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<form method="post">
<input type="number" name="leftOp" required>
<select name="operator" required>
	<option value>연산자</option>
	<option value="PLUS">+</option>
	<option value="MINUS">-</option>
	<option value="MULTIPLY">*</option>
	<option value="DIVIDE">/</option>
</select>
<input type="number" name="rightOp" required>
<button type="submit">=</button>
</form>
<span id="resultArea"><%= Objects.toString(request.getAttribute("expression"), "") %></span>
</body>
</html>