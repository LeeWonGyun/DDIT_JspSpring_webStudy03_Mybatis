//context path : /time
//service uri : /time/now.do

//content 형태 : 
//<h4>당신의 접속 시간 : ...입니다</h4>

package kr.or.ddit.servlet01;
import javax.servlet.http.*;
import javax.servlet.*; 
import java.io.*;
import javax.servlet.annotation.*;
import java.util.*;


public class TimeServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException, ServletException
	{
//		1. Mime 설정
		resp.setContentType("text/html;charset=UTF-8");
//		2. tmpl파일 열기
		String tmplPath = req.getServletPath();
		InputStream is = getServletContext().getResourceAsStream(tmplPath);
		StringBuffer tmplSrc = new StringBuffer();
		InputStreamReader isr = new InputStreamReader(is,"UTF-8");
		BufferedReader reader = new BufferedReader(isr);
		String temp = null;
		while((temp = reader.readLine()) != null) {
			tmplSrc.append(String.format("%s\n",temp));
		}
//		3. 데이터생성
		Calendar cal = Calendar.getInstance();
		Object data = String.format("%tc",cal);
//		4. 데이터 치환
		String html = tmplSrc.toString().replace("%now%", data.toString());
//		5. 응답 전송

		PrintWriter out = null;
		try{
			out = resp.getWriter();
			out.println(html);
		}finally{
			if(out!=null)
				out.close();
		}	
		
	}
}
