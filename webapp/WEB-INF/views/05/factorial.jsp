<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--반면 이 경우 전역변수화 하는것이기에 자바처럼 접근제한자 같은것을 쓴다 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05/factorial.jsp</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
//선언부(메소드), 서버사이드 검증, 재귀호출, 공백, 연산처리불가 파라미터
<form id="factorialForm" method="post"> 
	<input type="number" name="operand" min="1" max="10"  />
	<input type="submit" value="!" />
	<span id="resultArea"><%=request.getAttribute("result")%></span>
</form>
<script>
	$("#factorialForm").on("submit",function(event){
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
</body>
</html>