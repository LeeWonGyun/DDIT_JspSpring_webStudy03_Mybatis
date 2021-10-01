<%@page import="kr.or.ddit.enumpkg.OperatorType"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04/calculate.jsp</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<form id="calForm" method="post"> 
<input type = "number" name = "leftOp" required/> 
<select name = "operator"> 
   <option value>연산자</option> 
   <%
      for(OperatorType tmp : OperatorType.values()){
         %>
         <option value="<%=tmp.name() %>"><%=tmp.getSign() %></option>
         <% 
      }
   %>
</select>
<input type = "number" name = "rightOp"> 
<button type="submit">=</button>
</form>

<span id="resultArea"><%=Objects.toString(request.getAttribute("expression"), "") %></span>    <!-- 만약 결과값이 null값인 경우 두번째 파라미터에 화이트스페이스""를 준다. -->
<!-- 2 * 3 = 6 -->

<script type="text/javascript">

   let resultArea = $("#resultArea");
   $("#calForm").on("submit", function(event){   // 폼태그에서 submit을 했을 때 발생하는 event를 파라미터로 받아와야 한다. => 그래야 밑에서 event.preventDefault() 사용가능
      event.preventDefault();   // form태그는 '동기'에서 사용 => 비동기로 하기 위해서는 form태그에 의한 submit이벤트를 중단시켜야 한다. => prevendDefault() 사용하여 중단
      let url = this.action;   // url은 form태그의 action(서블릿)으로 넘겨줘야함
      let method = this.method; 
//       let data = $(this).serialize();   // 직렬화하여 마치 쿼리String형태로 넘겨준다. => leftOp=3&rightOp=5&operator=PLUS 
      let data = {};
      let children = $(this).find(":input[name]")   // $(this) => 데이터'this'를 감싸고 있는 제이쿼리 래퍼객체 
      console.log(children);   
      
      $.each(children, function(index, child){
         let name = this.name;
         let value = $(this).val();
         data[name] = value; 
      });
      
      console.log(data);
      
      $.ajax({ // 윗줄에서 동기방식을 중단시켰으니 이제 비동기요청을 해준다. => 제이쿼리 프레임워크의 ajax 사용 
            // '요청'이라는 것을 하기 위해서는 적어도 3가지가 필요하다 => url, data, method 
         url : url, 
         data : data,  
         method : method,
         dataType : "json",   // 데이터타입은 request의 accept, 응답데이터(response)의 content-type에 영향을 미친다. (마샬링 여부를 판단 => json이면 마샬링을 함)
                        // 둘의 타입이 서로 맞아야 함 => 서블릿에서 request.getHeader("Accept");로 꺼낼 수 있다. 
         success : function(resp) { // 응답데이터 resp의 타입은 위의 dataType에 따라 달라진다. 
                              // resp => json이 언마샬링 된 후의 자바스크립트 객체 
            resultArea.html(resp.expression);                  
         },
         error : function(xhr, errorResp, error) { // xhr => 요청을 보낼때의 모든 정보를 가지고 있음
            console.log(xhr);
            console.log(errorResp);
            console.log(error);
         }
      });  
      return false;   // 이벤트 종료 
   });
</script>

</body>
</html>