package kr.or.ddit.servlet04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/factorial.do")
public class FactorialServlet extends HttpServlet {
	
	private long factorial(int operand){
		if(operand < 0) throw new IllegalArgumentException("연산 수행 불가");
		if(operand <=1){
			return operand;
		}else{
			return operand * factorial(operand-1);
		}
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//서버사이드가 사용하는 경로이므로, context path와 webapp 은 지운다.
		req.getRequestDispatcher("/WEB-INF/views/05/factorial.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String accept = req.getHeader("Accept");
		
		// 스크립틀릿은 서블릿의 service 를 작성하는것. 즉, request 객체를 사용할 수 있다	
		String param = req.getParameter("operand");
		int sc = HttpServletResponse.SC_OK;
		String message = null;
		long result = -1;
		if(param!=null && !param.isEmpty()){
			try{
				int operand = Integer.parseInt(param);
				result = factorial(operand);
				req.setAttribute("result", result);
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
			String json = String.format(pattern,"result",result);
			
			//직렬화
			resp.setContentType("application/json;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.print(json);
		}else {
			req.getRequestDispatcher("/WEB-INF/views/05/factorial.jsp").forward(req, resp);
		}
	}


}
