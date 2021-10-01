<%@page import="java.nio.file.Files"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>application(ServletContext)</h4>
<pre>
서버와 대화하기 위한 객체. 서버(톰캣)을 제어할 수 있다
	: 서블릿 객체가 운영되는 어플리케이션(context)과 container(WAS) 에 대한 정보를 가진 객체
	: 하나의 컨텍스트당 하나씩 운영됨.

	1. 서버의 정보를 확인
		<%=application.getServerInfo() %> //개발서버와 운영서버가 다를때, 확인하기 위해
		<%=application.getMajorVersion() %>.<%=application.getMinorVersion() %>
	2. logging
		<%	//logging 조건 : message, layout, appender, logger, event level
			application.log("서버 통계 목적으로 남기는 로그");
		%>
	3(*****). 웹리소스 확보
		<%
			String path="/resources/images/cat2.png"; //논리적인 경로
			String realPath = application.getRealPath(path); //물리적인 경로
			application.getResource(path); 
			application.getResourceAsStream(path);
			//톰캣의 경로 - D:\A_TeachingMaterial\6.JspSpring\workspace\.metadata\.plugins\org.eclipse.wst.server.core
			//어플리케이션의 경로 - /\tmp0\wtpwebapps\webStudy01\resources\images\cat3.png
			File srcFile = new File(realPath);
			System.out.println(srcFile.getName());//cat3.png
			String destFolderURL = "/09";
			String destFolderFileSystemPath = application.getRealPath(destFolderURL);
			//D:\A_TeachingMaterial\6.JspSpring\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\webStudy01\09
			File destFolder = new File(destFolderFileSystemPath);
			File destFile = new File(destFolder, srcFile.getName()); //destFolder 경로에 있는 srcFile.getName() 파일객체
			System.out.println(destFile);
			Path destPath = Paths.get(destFolderFileSystemPath, srcFile.getName());			
			String destFileURL = destFolderURL + "/" + srcFile.getName();
			try(
// 				InputStream is = application.getResourceAsStream(path);
				InputStream is = new FileInputStream(srcFile);
// 				OutputStream os = new FileOutputStream(destFile);
			){
				Files.copy(is,destPath);
				//realPath를 이용해 구한 경로를 파일 객체로 만들어 주고,
				//realPath를 이용해 구한 경로를 Path 객체로 만들어준다
			}
			
			
			//논리적인 경로를 통해 물리적 경로를 찾는다 -> 파일 객체 만든다 -> stream 생성 -> 복사 -> img 태그로 그리기 
		%>
		<%=path %>
		<%=realPath %>
	4. 컨텍스트 파라미터 확보
		<%=application.getInitParameter("contentFolder") %>
	5.  
</pre>
<img src="<%=request.getContextPath() %><%=destFileURL %>" >
</body>
</html>