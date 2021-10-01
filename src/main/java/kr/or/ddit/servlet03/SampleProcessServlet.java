package kr.or.ddit.servlet03;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sampleProcess.do")
public class SampleProcessServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("get callback");
		//doGet에서는 바디가 없으니 해당 메서드가 의미가 없다
		request.setCharacterEncoding("UTF-8");

		String textParam = request.getParameter("textParam");
		String numberParam = request.getParameter("numberParam");
		String radioParam = request.getParameter("radioParam");
		String[] checkParam = request.getParameterValues("checkParam");
		String singleParam = request.getParameter("singleSelect");
		String[] multiSelect = request.getParameterValues("multiSelect");

		System.out.printf("textParam : %s\n", textParam);
		System.out.printf("numberParam : %s\n", numberParam);
		System.out.printf("radioParam : %s\n", radioParam);
		System.out.printf("checkParam : %s\n", Arrays.toString(checkParam));
		System.out.printf("singleParam : %s\n", singleParam);
		System.out.printf("multiSelect : %s\n", Arrays.toString(multiSelect));

		Map<String, String[]> parameterMap = request.getParameterMap();
		for (Entry<String, String[]> entry : parameterMap.entrySet()) {
			String name = entry.getKey();
			String[] values = entry.getValue();
			System.out.printf("%s : %s\n", name, Arrays.toString(values));
		}

		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			String[] values = request.getParameterValues(name);
			System.out.printf("%s : %s\n", name, Arrays.toString(values));
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {

		// 요청에 body가 있을때(post방식일때) 사용 가능. 톰캣 8.5이상에서 get방식에서 line에 들어있는 부분은 자동으로 인코딩이
		// 돤다.
		
	}
}
