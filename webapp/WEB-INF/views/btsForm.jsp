<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	File[] btsFiles = (File[])request.getAttribute("files");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<form action="/webStudy01/btsinfo.do">
<select name="bts" id="selectArea">
	<option value>목록</option>
	<%
		for(int i=0; i<btsFiles.length; i++){
	%>
			<option value="<%=btsFiles[i].getName() %>"><%=btsFiles[i].getName() %></option>
	<% 		
		}
	%>
</select>
</form>

<script>
	$(function(){
		
		let selectTag = $("#selectArea")
		$("select").on("change",function(){
			$(this.form).submit()
		})
		
		$("form").on("submit", function(){
			var valid = true
			var value = selectTag.val()
			if(!value){
				valie = false
			}
			
			return valid
		})
		
	})
</script>
</body>
</html>