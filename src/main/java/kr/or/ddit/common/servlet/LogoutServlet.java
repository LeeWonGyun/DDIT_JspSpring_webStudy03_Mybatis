package kr.or.ddit.common.servlet;

import java.io.IOException;import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login/logout.do")
public class LogoutServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.isNew()) {
			resp.sendError(HttpServletResponse.SC_BAD_REQUEST);
			return;
		}
		
//		session.removeAttribute("authMember");//세션의 모든 속성을 제거하지 않을때 사용됨
		session.invalidate();//세션의 모든 속성 제거, 세션 만료, 세션  id 삭제\
//		getServletContext().setAttribute(arg0, arg1); //객체가 싱글톤이므로 모든사람이 이를 볼 수 있음.
		String message = URLEncoder.encode("로그아웃 성공","UTF-8");
		resp.sendRedirect(req.getContextPath() + "/?message="+message);
	}
}
