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
<form id="calForm" method="post">
<!--1. leftOp, rightOp, operator 
	2. 비동기 요청 구조
	3. 응답 데이터의 mime : json-->
	<input type="text" name="leftOp" value=""/>
	<select name="cal">
   		<option value>선택</option>
   		<option>+</option>
   		<option>-</option>
   		<option>*</option>
   		<option>/</option>
	<input type="text" name="rightOp" value=""/>
	<input type="submit" value="="/>
	<span id="resultArea"></span>
</form>
<script>
	$("#calForm").on("submit",function(event){
		event.preventDefault(); //이벤트 발생 전에 중단시킴. 즉 동기요청을 중단시킴
		let url = this.action;
		let method = this.method
		let data = $(this).serialize();
		console.log(data);
		$.ajax({
			url :url,
			data:data,
			method:method,
			dataType:"json", //마임타입 설정. accept(req) content-type(resp) text/html, text/plain, application/xml, application/json, text/script
			success:function(resp){
				$("#resultArea").html(resp.result);
			},
			error:function(xhr, errorResp, error){
				console.log(xhr);
				console.log(errorResp);
				console.log(error);
			}
			
		})
		return false;
	})
</script>
<!-- 2 * 3 = 6 -->
</body>
</html>