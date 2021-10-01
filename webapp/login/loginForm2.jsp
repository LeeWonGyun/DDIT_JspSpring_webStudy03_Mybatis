<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login/loginForm.jsp</title>
<%
   String message = (String) session.getAttribute("message");
   if(StringUtils.isNotBlank(message)) {
      //flash attribute
      //한번 자기 역할을 다한 attribute는 삭제시킴
      session.removeAttribute("message");
   %>
      <script>         
         alert("<%= message %>");
      </script>
   
<%   
   }
%>

</head>
<body>
<form action="<%=request.getContextPath() %>/login/loginProcess.do" method="post">
   <ul>
      <li>
      <%  String failId = (String) session.getAttribute("mem_id");
         //flash attribute
         session.removeAttribute("mem_id");
      %>
<!--          dispatch 방식으로 왔기때문에 request 객체가 그대로 살아있어서 getParameter 가 가능 -->
         아이디 : <input type="text" name="mem_id" value="<%=Objects.toString(failId, "") %>"/>
      </li>
      <li>
         비밀번호 : <input type="text" name="mem_pass"/>
         <input type="submit" value="로그인" />
      </li>
   </ul>
</form>
</body>
</html>