<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/responseDesc.jsp</title>
</head>
<body>
<h4>response(HttpServletResponse)</h4>
<pre>
	:서버에서 클라이언트로 전송되는 응답과 관련된 모든 정보를 캡슐화한 객체
	Http 프로토콜에 따른 response 패키징 방식
	1. response Line : response status code(응답 상태 코드)
		: 명령 처리 결과를 표현하는 세자리 숫자
			Http - stateless, connectless
		1) 100 ~ : ing... (stateless, connectless 는 연결이 끊기면 데이터도 없어진다. 
		그러나 statefull, connectfull의 경우는 연결 통로를 유지시킨다. websocket 이라는 기술을 통해 연결을 유지한다. 이때 100번대 코드를 사용한다.)
		2) 200 ~ : OK(처리 성공)
		3) 300 ~ : 처리가 완료되려면, 클라이언트로부터 추가 액션이 필요함
			304(Not Modified),코드 이후 한번 더 일을 한다(캐시에서 정적 자원을 뒤져서 응답한다) 302/307(Moved) - header의 location 과 함께 사용. 즉 브라우져가 일을 한번 더해야 함
		4) 400 ~ : client side fail
			404(Not Found), 400(Bad Request)
			401<%=HttpServletResponse.SC_UNAUTHORIZED %>,클라이언트가 자원에 접근 허가 안됨 403<%=HttpServletResponse.SC_FORBIDDEN %> 클라이언트에게 허용되지 않은 자원 (데이터 보호 시 사용)
			405<%=HttpServletResponse.SC_METHOD_NOT_ALLOWED %>
			415<%=HttpServletResponse.SC_UNSUPPORTED_MEDIA_TYPE %> 마임과 연관. 클라이언트가 서버에서 처리할 수 없는 타입을 요구했을때.
		5) 500 ~ : server side fail, 500(Internal server error)
		상태 코드 변경시 : response.sendError[sendRedirect]
	2. response Header : content meta data, setHeader(name, value)
		1)content mime setting : Content-Type
			response.setHeader("Content-Type", "text/plain;charset=UTF-8");
			response.setContentType(value);
 			page 지시자의 contentType 속성
		2)cache control
			<a href="casheControl.jsp">casheControl.jsp</a>
		3)auto request 를 통한 페이지 갱신
			<a href="autoRequest.jsp">autoRequest.jsp</a>
		4)flow control
			<a href="flowControl.jsp">flowControl.jsp</a>
	3. response Body(Content Body, Message Mody)
		: request method 가 head 인 경우, body 가 구성되지 않음.
		: redirect 이동 방식의 경우, 중간에 body 가 없는 응답이 전송.
</pre>
<img src="<%=request.getContextPath() %>/resources/images/cat1.jpg" />
</body>
</html>