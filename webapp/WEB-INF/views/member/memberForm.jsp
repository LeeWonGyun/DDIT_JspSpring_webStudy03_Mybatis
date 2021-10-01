<%@page import="java.util.Objects"%>
<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/memberForm.jsp</title>
<%
   String message = (String) request.getAttribute("message"); // 있을경우에만 메세지 띄움
   if (StringUtils.isNotBlank(message)) {
%>
<script type="text/javascript">
         alert("<%=message%>");
</script>
<%
   }
%>
</head>
<body>
   <%
      //    MemberVO member = (MemberVO) request.getAttribute("member"); // 아래 'jsp:useBean'이 이 코드를 대체함. 
      //    if(member==null){   
      //       member = new MemberVO();
      //    }

      //    Map<String, String> errors = (Map) request.getAttribute("errors");   // errors => 검증 결과 메세지 들어있음       // 이거 null일 수도 있음
      // 처음 여기 왔을 경우 nullPointerException 뜰 수 있음  => 아래 jsp:useBean이 대체
   %>
   <jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request"></jsp:useBean>
   <!-- jsp:useBean => 자바빈 객체를 사용하겠다 => 자바 코드로 바뀜 -->
   <!-- 즉, 이거 사용하면 어떤 경우에도 널포인터 익셉션 방지할 수 있음. => 널인경우 만들어 주니까! -->
   <jsp:useBean id="errors" scope="request"
      class="java.util.LinkedHashMap"></jsp:useBean>
   <!-- Map은 그냥 인터페이스라서 지정 불가능 => 링크드 해쉬맵 사용 -->

   <form method="post"
      action="<%=request.getContextPath()%>/member/memberUpdate.do">

      <table>
         <tr>
            <th>회원아이디</th>
            <td><input type="text" name="memId" required
               value="<%=Objects.toString(member.getMemId(), "")%>" /> <!-- required 사용해도 클라이언트가 url에서 값을 빼버릴 수 있으므로 검증이 따로 필요 -->
               <span class="error"><%=errors.get("memId")%></span></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type="text" name="memPass" required
               value="<%=member.getMemPass()%>" /><span class="error"><%=errors.get("memPass")%></span></td>
         </tr>
         <tr>
            <th>회원명</th>
            <td><input type="text" name="memName" required
               value="<%=member.getMemName()%>" /><span class="error"><%=errors.get("memName")%></span></td>
         </tr>
         <tr>
            <th>주민번호1</th>
            <td><input type="text" name="memRegno1" required
               value="<%=member.getMemRegno1()%>" /><span class="error"><%=errors.get("memRegno1")%></span></td>
         </tr>
         <tr>
            <th>주민번호2</th>
            <td><input type="text" name="memRegno2" required
               value="<%=member.getMemRegno2()%>" /><span class="error"><%=errors.get("memRegno2")%></span></td>
         </tr>
         <tr>
            <th>생일</th>
            <td><input type="date" name="memBir"
               value="<%=member.getMemBir()%>" /><span class="error"><%=errors.get("memBir")%></span></td>
         </tr>
         <tr>
            <th>우편번호</th>
            <td><input type="text" name="memZip" required
               value="<%=member.getMemZip()%>" /><span class="error"><%=errors.get("memZip")%></span></td>
         </tr>
         <tr>
            <th>주소1</th>
            <td><input type="text" name="memAdd1" required
               value="<%=member.getMemAdd1()%>" /><span class="error"><%=errors.get("memAdd1")%></span></td>
         </tr>
         <tr>
            <th>주소2</th>
            <td><input type="text" name="memAdd2" required
               value="<%=member.getMemAdd2()%>" /><span class="error"><%=errors.get("memAdd2")%></span></td>
         </tr>
         <tr>
            <th>집전번</th>
            <td><input type="text" name="memHometel" required
               value="<%=member.getMemHometel()%>" /><span class="error"><%=errors.get("memHometel")%></span></td>
         </tr>
         <tr>
            <th>회사전번</th>
            <td><input type="text" name="memComtel" required
               value="<%=member.getMemComtel()%>" /><span class="error"><%=errors.get("memComtel")%></span></td>
         </tr>
         <tr>
            <th>휴대폰</th>
            <td><input type="text" name="memHp"
               value="<%=member.getMemHp()%>" /><span class="error"><%=errors.get("memHp")%></span></td>
         </tr>
         <tr>
            <th>이메일</th>
            <td><input type="text" name="memMail" required
               value="<%=member.getMemMail()%>" /><span class="error"><%=errors.get("memMail")%></span></td>
         </tr>
         <tr>
            <th>직업</th>
            <td><input type="text" name="memJob"
               value="<%=member.getMemJob()%>" /><span class="error"><%=errors.get("memJob")%></span></td>
         </tr>
         <tr>
            <th>취미</th>
            <td><input type="text" name="memLike"
               value="<%=member.getMemLike()%>" /><span class="error"><%=errors.get("memLike")%></span></td>
         </tr>
         <tr>
            <th>기념일</th>
            <td><input type="text" name="memMemorial"
               value="<%=member.getMemMemorial()%>" /><span class="error"><%=errors.get("memMemorial")%></span></td>
         </tr>
         <tr>
            <th>기념일자</th>
            <td><input type="date" name="memMemorialday"
               value="<%=member.getMemMemorialday()%>" /><span class="error"><%=errors.get("memMemorialday")%></span></td>
         </tr>
         <tr>
            <th>마일리지</th>
            <td>3000</td>
         </tr>

         <tr>
            <td colspan="2">
               <input type="submit" value="저장" />
               <input type="reset" value="취소" />
            </td>   
         </tr>
      </table>
   </form>
</body>
</html>