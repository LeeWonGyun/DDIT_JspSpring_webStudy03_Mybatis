<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>07/implicitObject.jsp</title>
</head>
<body>
<h4>기본객체(내장 객체)</h4>
<pre>
	: JSP 에 해당하는 서블릿 소스가 파싱될때 컨테이너에 의해 기본 제공되는 객체

	1. request(HttpServletRequest)
	2. response(HttpServletResponse)
	3. <a href="bufferDesc.jsp">out(JspWriter)</a> : 출력스트림으로 버퍼에 응답 데이터룰 기록할때 이용됨. 버퍼 제어에 사용
	4. <a href="../09/sessionDesc.jsp">/session(HttpSession) / Cookie <a>
	5. <a href="../10/servletContext">application(ServletContext)</a>
	
	6. config(ServletConfig) : 어플리케이션당 하나. 서블릿의 메타정보를 갖고있다. jsp에서는 사용 빈도가 떨어진다.
	7. page(Object-Jsp 인스턴스, this 와 같은 의미)
	
<!--상단에 isErrorPage 추가 시, 해당 jsp는 에러처리를 위한 페이지로 인식하여 코드어시스트에서 사용할 수 있다 -->
	8. exception(Throwable)<%  %> : 에러 처리 용도의 페이지에서 활성화(IsErrorPage="true")
<!-- 중요 -->
	9. pageContext : 가장 먼저 생성되는 기본 객체. 나머지 객체의 참조를 소유함.
</pre>
</body>
</html>