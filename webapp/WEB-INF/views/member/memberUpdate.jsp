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
<title>/member/memberUpdate.jsp</title>
</head>
<body>
   <jsp:useBean id="member" class="kr.or.ddit.vo.MemberVO" scope="request"></jsp:useBean>
   <form method="post"
      action="<%=request.getContextPath()%>/member/memberUpdate.do">
      <table>
         <tr>
            <th>회원아이디</th>
            <td><input type="text" name="memId" required
               value="<%=Objects.toString(member.getMemId(), "")%>" /> <!-- required 사용해도 클라이언트가 url에서 값을 빼버릴 수 있으므로 검증이 따로 필요 -->
            </td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type="text" name="memPass" required
               value="<%=member.getMemPass()%>" /></td>
         </tr>
         <tr>
            <th>회원명</th>
            <td><input type="text" name="memName" required
               value="<%=member.getMemName()%>" /></td>
         </tr>
         <tr>
            <th>주민번호1</th>
            <td><input type="text" name="memRegno1" required
               value="<%=member.getMemRegno1()%>" /></td>
         </tr>
         <tr>
            <th>주민번호2</th>
            <td><input type="text" name="memRegno2" required
               value="<%=member.getMemRegno2()%>" /></td>
         </tr>
         <tr>
            <th>생일</th>
            <td><input type="date" name="memBir"
               value="<%=member.getMemBir()%>" /></td>
         </tr>
         <tr>
            <th>우편번호</th>
            <td><input type="text" name="memZip" required
               value="<%=member.getMemZip()%>" /></td>
         </tr>
         <tr>
            <th>주소1</th>
            <td><input type="text" name="memAdd1" required
               value="<%=member.getMemAdd1()%>" /></td>
         </tr>
         <tr>
            <th>주소2</th>
            <td><input type="text" name="memAdd2" required
               value="<%=member.getMemAdd2()%>" /></td>
         </tr>
         <tr>
            <th>집전번</th>
            <td><input type="text" name="memHometel" required
               value="<%=member.getMemHometel()%>" /></td>
         </tr>
         <tr>
            <th>회사전번</th>
            <td><input type="text" name="memComtel" required
               value="<%=member.getMemComtel()%>" /></td>
         </tr>
         <tr>
            <th>휴대폰</th>
            <td><input type="text" name="memHp"
               value="<%=member.getMemHp()%>" /></td>
         </tr>
         <tr>
            <th>이메일</th>
            <td><input type="text" name="memMail" required
               value="<%=member.getMemMail()%>" /></td>
         </tr>
         <tr>
            <th>직업</th>
            <td><input type="text" name="memJob"
               value="<%=member.getMemJob()%>" /></td>
         </tr>
         <tr>
            <th>취미</th>
            <td><input type="text" name="memLike"
               value="<%=member.getMemLike()%>" /></td>
         </tr>
         <tr>
            <th>기념일</th>
            <td><input type="text" name="memMemorial"
               value="<%=member.getMemMemorial()%>" /></td>
         </tr>
         <tr>
            <th>기념일자</th>
            <td><input type="date" name="memMemorialday"
               value="<%=member.getMemMemorialday()%>" /></td>
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