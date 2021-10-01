
<%@page import="java.io.FilenameFilter"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	File[] images = (File[])request.getAttribute("images");
%>    
<!-- 1단계 : 서블릿 만들고 jsp에 있는 코드 옮기기
	2단계 : 제이쿼리 이용해 사진 선택시 화면 바뀌지 않고 하단에 표싣 -->
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		let imageArea = $("#imageArea")
		const SRCPTRN = "<%= request.getContextPath()%>/image.do?image=%v";
		$("[name='image']").on("change", function(event){
			console.log(event);
			console.log(this);
			console.log($(this));
// 			this.form.submit();
// 			$(this.form).trigger("submit");
			let image = $(this).val();
			imageArea.empty();
			if(image){
				let src = SRCPTRN.replace("%v",image);
				let imgTag = $("<img>").attr("src", src)
				imageArea.html(imgTag);
				return true;
			}	
		})
		
		$("form:first").on("submit",function(event){
			console.log(event);
			let value = $(this.image).val();
			console.log(value);
			let valid = true;
			if(!value){
				console.log("파라미터 누락");
				valid = false;
				$(this.image).focus();
			}
	 		return valid;			
		})
	})
</script>
</head>
<body>
<form action="<%=request.getContextPath() %>/image.do">
	<select name="image" required">
		<option value>이미지 선택</option>
		<%
			for(int i=0; i<images.length; i++){
				out.println("<option>"+ images[i].getName() + "</option>");
			}
		%>
	</select>
</form>
<div id="imageArea"></div>
</body>
</html>