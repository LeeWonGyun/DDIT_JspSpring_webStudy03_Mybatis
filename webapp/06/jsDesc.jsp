<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>

<form name="testForm" action="<%=request.getContextPath() %>/marshallingTest.do" method="post">
   <input type="text" name="p1" placeholder="p1"/> <br />
   <input type="text" name="p1" placeholder="p1"/> <br />
   <input type="number" name="p2" placeholder="p2"/> <br />
   <input type="number" name="p2" placeholder="p2"/> <br />
   
   <select name="p3" id="">
      <option>o1</option>
      <option>o2</option>
   </select>
   <br />
   <input type="submit" value="전송" />
   
</form>
<script>
   let nameSet = new Set();
   //태그에 name을 부여한다 => document에 name으로 객체를 생성한다
   $(document.testForm).on("submit", function(event) {
      event.preventDefault();
      let form = this;
//       let data = $(this).serialize()
//       console.log(data)
//       p1=text&p1=text&p2=2&p2=3&p3=o2
//        let data = {
//          p1 : ["text", "text"],
//          p2 : [2, 3],
//          p3 : "o2"
//       } 
      let data = {};
      
      for(let name of nameSet){
    	  let children = $(form).find('[name="'+name+'"]');
    	  let value = null;
    	  if(children.length > 1){
    		  value = [];
    		  $(children).each(function(index, child){
    			  if(child.type == 'number'){
    				  value.push(parseInt($(this).val()))
    			  }else{
	    			  value.push($(this).val());
    			  }
    		  })
    	  }else{
    		  value = $(children).val();
    	  }
    	  data[name] = value
      }
      
      console.log(data);
      let jsonData = JSON.stringify(data);
//       console.log(jsonData)
//       p1=text&p2=3&p3=o2
//       let data = {
//          p1 : "text",
//          p2 : 3,
//          p3 : "o2"
//       }
      let url = this.action
      let method = this.method
//       let data = $(this).serialize()
      console.log(url)
      console.log(method)
      $.ajax({
         url : url,
         data : jsonData,
         method : "post",
         contentType : "application/json;charset=UTF-8"
//          dataType : "json", 
//          success : function(resp) {

//          },
//          error : function(xhr, errorResp, error) {
//             console.log(xhr);
//             console.log(errorResp);
//             console.log(error);
//          }
      })
      

   }).find(":input[name]").each(function(index, input) {
      //attr 이 아닌 prop를 쓴 이유 => required가 boolean 타입이기 때문
      nameSet.add(input.name);
      $(input).prop("required", true)
   })





   //JS의 객체 표현 방식
   //js 에서의 객체는 배열과 비슷한 구조로 관리하고 있다 => inchanted for 문으로 접근이 가능
   //js 에서도 java의 collection들을 사용 가능 , map , set , 등
   
   //dot notation
//    let obj = {
//          prop1 : 23,
//          prop2 : "text"
//    }
//    obj.prop3 = "text3";
   
//    //연상(연관)배열 구조
//    obj["prop4"] = "text4";
//    console.log(obj)
   
//    for(let name in obj) {
//       let propValue = obj[name];
//       console.log(name + " : " + propValue)
//    }
   
//    let array = ["a"]
//    array.push("b");
//    console.log(array.length)
   
//    for(let index in array) {
//       console.log(index)
//    }
   
//    //of 연산자는  collection의 형태만 올수 있다
//    for(let element of array) {
//       console.log(element)
//    }
   
//    let testSet = new Set();
//    let testMap = new Map();
//    testSet.add("a")
//    testMap.set('key1', 'value1')
   
//    for(let tmp of testSet) {
//       console.log(tmp)
//    }
   
//    for(let tmp of testMap) {
//       console.log(tmp)
//    }
   
   
</script>
</body>
</html>