package kr.or.ddit.servlet06;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Locale;

import static java.util.Calendar.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getServerTime.do")
public class GetServerTimeServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String langage = req.getParameter("language");
		Locale clientLocale = req.getLocale(); // Accept-Langage
		if(langage != null && !langage.isEmpty()) {
			clientLocale = Locale.forLanguageTag(langage);
		}
		//시간데이터 동적으로 만듦, 응답데이터로 내보냄.
		//응답컨텐츠 : text/plain;charset=UTF-8
		Calendar now = getInstance();
		String content = String.format(clientLocale, "%tc",now);
		resp.setContentType("text/html;charset=UTF-8");
		try(
			PrintWriter out = resp.getWriter();
		){
			out.print(content);
		}
		
	}
}
