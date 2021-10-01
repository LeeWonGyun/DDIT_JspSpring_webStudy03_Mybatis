package kr.or.ddit.servlet02;
import javax.servlet.http.*;
import javax.servlet.*; 
import java.io.*;
import javax.servlet.annotation.*;

@WebServlet("/image.do")
public class ImageServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException, ServletException
	{
		////아래는 검증하여서 500 상태코드(서버문제)가 아닌 클라이언트에 문제있음을 알려주기 위함이다.
		
		//클라이언트에서 파라미터를 잘못 넘겼을 때
		String fileName = req.getParameter("image");
		File folder = (File)getServletContext().getAttribute("contentFolder");
		if(fileName==null) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
		//클라이언트가 요구한 파일이 없을 때
		File imageFile = new File(folder, fileName);
		if(!imageFile.exists()) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		
		//사진이 아닌 다른것을 요구했을 때
		String mime = getServletContext().getMimeType(imageFile.getName());
		if(mime == null || !mime.startsWith("image/")) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		resp.setContentType(mime);
		
		FileInputStream fis = new FileInputStream(imageFile);
		byte[] buffer = new byte[1024];
		int count = -1;
		OutputStream os = resp.getOutputStream();
		while((count = fis.read(buffer)) != -1){
			os.write(buffer, 0, count);
		}
		fis.close();
		os.flush();
		os.close();
    }
}