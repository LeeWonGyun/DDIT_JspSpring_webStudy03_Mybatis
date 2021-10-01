<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03/sampleForm.jsp</title>
</head>
<body>
<h4>입력양식</h4>
<form action="<%=request.getContextPath() %>/sampleProcess.do" method="post">
<pre>
	<input type="text" name="textParam" required/> 입력데이터에 제한두지 않는다		
	<input type="number" name="numberParam" required/> 입력데이터 제한
	<input type="hidden" name="hiddenParam" value="hiddenText"/> 입력받기 위한것이 아님
	<label>
		<input type="radio" name="radioParam" value="radio1"/>Radio1 
		<input type="radio" name="radioParam" value="radio2"/>Radio2
	</label>
	<input type="checkbox" name="checkParam" value="Check1"/>Check1
	<input type="checkbox" name="checkParam" value="Check2"/>Check2
	<input type="checkbox" name="checkParam" value="CHeck3"/>Check3
	<select name="singleSelect" required>
		<option value>선택</option>
		<option>text1</option>
		<option>text2</option>
		<option>text3</option>
	</select>
	<select name="multiSelect" multiple size="10">
		<option>text1</option>
		<option>text2</option>
		<option>text3</option>
	</select>
	타입을 통해 발생하는 이벤트 제한(입력하는 구조가 아님. 데이터를 넘기는 구조 아님. 내용필요없음)
	<input type="button" value="버튼"/> 클릭 이벤트가 클릭에서 끝남	
	<input type="submit" value="전송"/> 클릭 후 자기를 감싸고 있는 form 데이터를 이괄시킴		
	<input type="reset" value="취소"/> 클릭 후 form 안의 모든 입력값을 초기화시킴		
</pre>
</form>
</body>
</html>