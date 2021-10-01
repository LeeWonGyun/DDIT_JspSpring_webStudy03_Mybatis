<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- /resources/images/* -> 이미지 목록 제공 -->
	<%
		File[] images = (File[]) request.getAttribute("images");
	%>
	<select size="10" name="srcSelect" required>
		<option value>이미지 선택</option>
		<%
			for (int i = 0; i < images.length; i++) {
				out.println("<option>" + images[i].getName() + "</option>");
			}
		%>
	</select>
	<div>
		<input type="radio" name="command" value="COPY" />COPY 
		<input type="radio" name="command" value="MOVE" />MOVE 
		<input type="radio" name="command" value="DELETE" />DELETE
	</div>
	<!-- /09/* -> 자원의 목록 제공 -->
	<%
		File[] destImages = (File[]) request.getAttribute("destImages");
	%>
	<select size="10" name="destSelect">
		<option value>이미지 선택</option>
		<%
			for (int i = 0; i < destImages.length; i++) {
				out.println("<option>" + destImages[i].getName() + "</option>");
			}
		%>
	</select>

	<script type="text/javascript">
		$("input[name=command]").on("change", function() {
			var select = $("select[name=srcSelect] option:selected").val();
			var radio = $('input[name=command]:checked').val();
			let data = {} //셀렉트 된 파일, 커맨드
			data.select = select
			data.radio = radio
			console.log(data)
			data = JSON.stringify(data)
			console.log(data)
			$.ajax({
				url : "/webStudy01/fileManager.do",
				data : data,
				method : "post",
				dataType : "json", // Accept(request), Content-Type(response)
				success : function(resp) {
					alert("작업성공")
				},
				error : function(xhr, errorResp, error) {
					console.log(xhr);
					console.log(errorResp);
					console.log(error);
					alert("작업실패")
				}
			})
			return false;
		})
	</script>
</body>
</html>












