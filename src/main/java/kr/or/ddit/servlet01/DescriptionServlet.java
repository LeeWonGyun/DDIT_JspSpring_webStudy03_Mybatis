package kr.or.ddit.servlet01;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 서블릿
 * : 웹상에서 발생하는 요청을 받고, 그에 따른 동적인 응답을 생성할 수 있는 객체에 대한 명세서(specification)
 *
 * 개발 단계
 * 1)HttpServlet의 상속으로 스펙에 따른 객체 정의
 * 2)컴파일 -> /WEB-INF/classes 에 크래스 배포
 * 3)서블릿 컨테이너에 해당 서블릿을 등록.
 * 		2.5 : web.xml -> servlet -> servlet-name, servlet-class
 * 		3.X : @WebServlet
 * 4)등록된 서블릿에  url-pattern 매핑(어떤 요청에 어떤 서블릿을 발생시킬것인가?)
 * 5)서버를 restart한다
 * 
 * servlet container : servlet의 lifecycle 관리자
 * 생성 : 컨테이너가 해당 서블릿에 매핑된 요청으로 최초의 요청을 받았을 때 생성. load-on-startup 옵션으로 생성 시점을 앞당길 수 있음 -> init
 * 요청 : 요청의 처리 순서(service-template method), request method 에 따라 구체적인 작업은 (doXXX-hookmethod) 에서 처리
 * 소멸 : destroy가 callback으로 호출되지만, 호출 구조를 장담할 수 없음
 */

public class DescriptionServlet extends HttpServlet{
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		System.out.println(getClass().getName()+"이 생성됨.");
	}
	
	//template method : super.service()
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			System.out.println("service메소드 호출");
//			super.service(req, resp);
			System.out.println("service메소드 종료");
		}
	
	//hook method
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet메소드 호출");
	}
	
	@Override
	public void destroy() {
		super.destroy();
		System.out.println(getClass().getName()+"이 소멸됨.");
	}
	
}
