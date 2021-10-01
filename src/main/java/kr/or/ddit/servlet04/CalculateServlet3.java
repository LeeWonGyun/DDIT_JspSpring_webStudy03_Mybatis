package kr.or.ddit.servlet04;

import java.io.IOException;
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

import kr.or.ddit.enumpkg.OperatorType;

//@WebServlet("/calculate.do")
public class CalculateServlet3 extends HttpServlet{
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      req.getRequestDispatcher("/WEB-INF/views/05/calculate3.jsp").forward(req, resp);
      
   }
   
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      String accept = req.getHeader("Accept");
      
      String leftParam = req.getParameter("leftOp");
      String rightParam = req.getParameter("rightOp");
      String opParam = req.getParameter("operator");
      
      double leftOp = -1;
      double rightOp = -1;
      String expression = null;
      String message = null;

      int sc = 200;
      try {
      
         leftOp = Double.parseDouble(leftParam);
         rightOp = Double.parseDouble(rightParam);
      
         OperatorType operator = OperatorType.valueOf(opParam);
         expression = operator.makeExpression(leftOp, rightOp);
      }catch (Exception e) {
         sc = 400;
         message = e.getMessage();
      }
      
      if(sc == 200) {
    	 Map<String, Object> jsonTarget = new HashMap<>();
    	 jsonTarget.put("expression", expression);
    	 jsonTarget.put("leftOp", leftOp);
    	 jsonTarget.put("rightOp", rightOp);
    	 
         if(accept.contains("json")) {
            //Mashalling===============================================
//        	 String jsonPattern = " \"%s\" : \"%s\" , ";
//            StringBuffer json = new StringBuffer("{");
//            for(Entry<String, Object> entry: jsonTarget.entrySet()) {
//            	String propName = entry.getKey();
//            	String propValue = Objects.toString(entry.getValue(),"");
//            	json.append(String.format(jsonPattern, propName));
//            }
//            int lastIndex = json.lastIndexOf(",");
//            if(lastIndex!=-1)
//        	 json.deleteCharAt(lastIndex);
//        	 json.append("}");
     
        	ObjectMapper objectMapper = new ObjectMapper(); 
//        	String json = objectMapper.writeValueAsString(jsonTarget);
        	
            //Serialization==============================================
            resp.setContentType("application/json;charset=UTF-8");
            try(
            PrintWriter out = resp.getWriter();
            ){
//            	out.print(json);
            	objectMapper.writeValue(out, jsonTarget);
            }
         }else {
            req.setAttribute("expression", expression);
            req.getRequestDispatcher("/WEB-INF/views/05/calculate3.jsp").forward(req, resp);
         }
      }else {
         resp.sendError(sc, message);
      }
      
   }
   
}