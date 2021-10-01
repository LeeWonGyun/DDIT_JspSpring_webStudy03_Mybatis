<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h4>
		세션 만료 시간 : <span id="sessionTimer"></span><br>
		현재 세션 ID : <span> <%=session.getId() %> </span>
	</h4>
	보낼 금액 <input type="text" >
	보낼 사람 <input type="text" >
	
	<div id="msArea">
		세션 연장 하시겠습니까?? <input type="button" id="yesBtn" value="예"class="controlBtn">
						 <input type="button" id="noBtn" value="아니오" class="controlBtn">
	</div>
	
	<script>
		$("#yesBtn").on('click',function(){
			//타이머 2분으로 돌리기
			var time = 10;
			//refresh
			location.reload();
		})
		$("#noBtn").on('click',function(){
			//세션없애기
			sessionStorage.clear();
// 			session.invalidate();
			//타이머 없애기
			clearInterval(timerID);
			//로그아웃 페이지로 이동
			location.href="end.jsp"
		})
	</script>
	
	<script type="text/javascript">
		var timerID; // 타이머를 핸들링하기 위한 전역 변수
		var time = 10; // 타이머 시작시의 시간
		let clientTime = $("#sessionTimer");

		setInterval(function() {
			decrementTime();
			$("#msArea").hide();
			if (time < 5){
				$("#msArea").show();
			}
		}, 1000);
		
		/* 남은 시간을 감소시키는 함수 */
		function decrementTime() {
			var x1 = document.getElementById("sessionTimer");
			x1.innerHTML = toHourMinSec(time);

			if (time > 0)
				time--;
			else {
				// 시간이 0이 되었으므로 타이머를 중지함
				clearInterval(timerID);
				//세션없애기
				sessionStorage.clear();
// 				session.invalidate();
				//로그아웃 페이지로 이동
				location.href="end.jsp"
			}
		}

		/* 정수형 숫자(초 단위)를 "시:분:초" 형태로 표현하는 함수 */
		function toHourMinSec(t) {
			var hour;
			var min;
			var sec;

			// 정수로부터 남은 시, 분, 초 단위 계산
			hour = Math.floor(t / 3600);
			min = Math.floor((t - (hour * 3600)) / 60);
			sec = t - (hour * 3600) - (min * 60);

			// hh:mm:ss 형태를 유지하기 위해 한자리 수일 때 0 추가
			if (hour < 10)
				hour = "0" + hour;
			if (min < 10)
				min = "0" + min;
			if (sec < 10)
				sec = "0" + sec;
			return (hour + ":" + min + ":" + sec);
		}
	</script>

</body>
</html>