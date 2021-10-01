<%@page import="java.util.Calendar"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>08/sessionTimer.jsp</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/custom/sessionTimer.js"></script>

<script>

   
</script>

</head>
<body>
<h4>세션 만료 시간 : <span id="sessionTimer"></span></h4>
<form action="/webStudy01/sessionTimer.do">
<div id="msgArea">
   세션 연장 하시겠습니까?
   <input type="button" id="yesBtn" value="예" class="controlBtn"/>
   <input type="button" id="noBtn" value="아니오" class="controlBtn"/>
</div>
</form>
<!-- 1. 세션 타이머 디스카운트  -->
<!-- 남은시간 => 세션만료시간 - (현재시간 - 마지막 접속시간)  -->
<!-- 2. 1분 남은 시점에 메시지를 통해 연장 여부 확인 -->
<!-- 3. 세션 타이머 종료 조건 처리 / 타이머 종료, 화면 리프레쉬 -->
<!-- 4. 세션 연장 처리 / 타이머 리셋, 세션 연장 시킬 비동기 요청 / 메소드 = head -->
</body>
<script>
   const TIMEOUT = <%=session.getMaxInactiveInterval() %>
   let msgArea = $("#msgArea")
   let sessionTimer = $("#sessionTimer").sessionTimer({
      timeout : TIMEOUT,
      msgArea : msgArea
   });
</script>
</html>