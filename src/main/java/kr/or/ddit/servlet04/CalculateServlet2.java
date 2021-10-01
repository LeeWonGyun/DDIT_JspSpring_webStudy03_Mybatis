package kr.or.ddit.servlet04;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculateServlet2 extends HttpServlet{

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String view = "/WEB-INF/views/05/calculate2.jsp";
		req.getRequestDispatcher(view).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String leftParam = req.getParameter("leftOp");
		String rightParam = req.getParameter("rightOp");
		String opParam = req.getParameter("operator");
	
		double leftOp = Double.parseDouble(leftParam);
		double rightOp = Double.parseDouble(rightParam);
		double result = -1d;
		String opSign = null;
		
		int sc = 200;
		if("PLUS".equals(opParam)) {
			result = leftOp + rightOp;
			opSign = "+";
		}else if("MINUS".equals(opParam)) {
			result = leftOp - rightOp;
		}else {
			sc = 400;
		}
		
		if(sc == 200) {
			String pattern = "%f %s %f = %f";
			String expression = String.format(pattern, leftOp, opSign, rightOp, result);
			req.setAttribute("expression", expression);
			String view = "/WEB-INF/views/05/calculate2.jsp";
			req.getRequestDispatcher(view).forward(req, resp);
		}else {
			resp.sendError(sc);
		}
	}
}
