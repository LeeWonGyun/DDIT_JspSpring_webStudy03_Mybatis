package kr.or.ddit.servlet04;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.enumpkg.BrowserType;
import kr.or.ddit.enumpkg.OperatorType;
import kr.or.ddit.vo.CalcVO;
import kr.or.ddit.vo.TestVO;

@WebServlet("/calculate.do")
public class CalculateServlet_sem extends HttpServlet{
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String view = "/WEB-INF/views/05/calculate_sem.jsp";
      req.getRequestDispatcher(view).forward(req, resp);
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  String accept = req.getHeader("Accept");
      String contentType = req.getHeader("Content-Type");
	  CalcVO vo = null;
	  int sc = 200;
      
      if(contentType.contains("json")) {
    	  try(
    			  InputStream is = req.getInputStream();
    		) {
    	         ObjectMapper objectMapper = new ObjectMapper();
    	         vo = objectMapper.readValue(is, CalcVO.class);
    	         System.out.println(vo);
    	      }catch(Exception e) {
    	    	  
    	      }
      }else {
    	 String leftParam = req.getParameter("leftOp");
 	     String rightParam = req.getParameter("rightOp");
 	     String opParam = req.getParameter("operator");
 	      
 	     String expression = null;
 	     String message = null;
 	     double leftOp = -1;
 	     double rightOp = -1;
 	      
 	     try {

 	         leftOp = Double.parseDouble(leftParam);
 	         rightOp = Double.parseDouble(rightParam);

 	         OperatorType operator = OperatorType.valueOf(opParam);
 	         expression = operator.makeExpression(leftOp, rightOp);

 	      } catch (Exception e) {
 	         sc = 400;
 	         message = e.getMessage();
 	         resp.sendError(sc,message);
 	      }
      }
      
      
     

     

      //enum??? ????????? ?????? ???????????? ????????? ?????? ????????? ????????? ?????????
      //????????? ??????????????? ?????? check??? ??????
    

      if(sc == 200) {
//         Map<String, Object> jsonTarget = new HashMap<String, Object>();
//         jsonTarget.put("expression", expression);
//         jsonTarget.put("leftOp", leftOp);
//         jsonTarget.put("rightOp", rightOp);
         
         if(accept.contains("json")) {
            //Mashalling
//            String jsonPattern = " \"%s\" : \"%s\",";
//            StringBuffer json = new StringBuffer("{");
//            for(Entry<String, Object> entry: jsonTarget.entrySet()) {
//               String propName = entry.getKey();
//               String propValue = Objects.toString(entry.getValue(), "");
//               json.append(String.format(jsonPattern, propName, propValue));
//            }
//            
//            //????????? , ????????????
//            int lastIndex = json.lastIndexOf(",");
//            if(lastIndex != -1) {
//               json.deleteCharAt(lastIndex);               
//            }
//            json.append("}");
            
            //???????????? ???????????? ???????????????
            //?????? ???????????? ???????????? ?????????????????? => ????????? String
            ObjectMapper objectMapper = new ObjectMapper();
//            String json = objectMapper.writeValueAsString(jsonTarget);
            //serialization
            resp.setContentType("application/json;charset=UTF-8");
            try(
                  PrintWriter out = resp.getWriter();                  
                  ) {
//               out.print(json);
               //????????? , ????????? ???????????? ????????? writeValue(stream, object) ?????????
               objectMapper.writeValue(out, jsonTarget);
            }
         } else {
            req.setAttribute("expression", expression);
            String view = "/WEB-INF/views/05/calculate_sem.jsp";
            req.getRequestDispatcher(view).forward(req, resp);            
         }
      } else {
         resp.sendError(sc, message);
      }


   }

	private String dataFormParameter(HttpServletRequest req, HttpServletResponse resp) throws IOException{
	      
	     return expression;
}

	private CalcVO dataFormJson(HttpServletRequest req, HttpServletResponse resp) throws IOException{
		CalcVO vo = null;
		try(InputStream is = req.getInputStream()){
			ObjectMapper ob = new ObjectMapper();
			vo = ob.readValue(is, CalcVO.class);
			return vo;
		}
	}
}