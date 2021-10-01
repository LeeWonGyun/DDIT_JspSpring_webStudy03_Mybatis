package kr.or.ddit.servlet04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculateServlet extends HttpServlet{

	
	private long calculate(int int_left, int int_right, String cal) {
		long result = 0;
		if(cal.equals("+")) {
			result = int_left + int_right;
			System.out.println(result);
		}else if(cal.equals("-")) {
			result = int_left - int_right;
		}else if(cal.equals("*")) {
			result = int_left * int_right;
		}else if(cal.equals("/")) {
			result = int_left / int_right;
		}else {
			result = 0;
		}
		return result;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/05/calculate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accept = req.getHeader("Accept");
		
		String left = req.getParameter("leftOp");
		String right = req.getParameter("rightOp");
		String cal = req.getParameter("cal");
		
		int sc = HttpServletResponse.SC_OK;
		String message = null;
		long result2 = 0;
		
		if((left!=null && !left.isEmpty()) && (right!=null && !right.isEmpty()) && (cal!=null && !cal.isEmpty())){
			try{
				int int_left = Integer.parseInt(left);
				int int_right = Integer.parseInt(right);
				System.out.println(int_left);
				result2 = calculate(int_left, int_right, cal);
				System.out.println(result2);
				req.setAttribute("result", result2);
			}catch(RuntimeException e){
				sc = HttpServletResponse.SC_BAD_REQUEST;	
				message = e.getMessage();
			}
		}
		if(sc!=HttpServletResponse.SC_OK){
		//	response.sendError(sc);
			resp.sendError(sc,message);
			return;
		}
		
		if(accept.contains("json")) {
			//Marshlling
			String pattern = "{\"%s\":%d}";
			String json = String.format(pattern,"result",result2);
			
			//직렬화
			resp.setContentType("application/json;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.print(json);
		}else {
			req.getRequestDispatcher("/WEB-INF/views/05/calculate.jsp").forward(req, resp);
		}
	}
}
