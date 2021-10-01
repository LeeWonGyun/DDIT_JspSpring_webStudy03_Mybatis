package kr.or.ddit.common.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/login/loginProcess.do")
public class loginProcessServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sc = 200;
		
		//1. 클라이언트의 파라미터를 받는다
		String mem_id = req.getParameter("mem_id");
		String mem_pass = req.getParameter("mem_pass");
		
		//2. 파라미터를 검증한다. 필수 파라미터 여부 판단하기. 누락시 실패의 원인을 400번대.
		if(mem_id == null || mem_pass == null || mem_id.isEmpty()==true || mem_pass.isEmpty()==true){
			 sc = 400;
	         resp.sendError(sc);
	         //리턴으로 해당 메서드를 종료시켜야 함. 응답 메세지로 에러를 보냈으나, 메서드가 종료되지 않고 밑으로 이동하여 또다시 forward를 하려고 하기에 500에러가 발생한다.
	         return;
		}
		
		
		//3. 잘 넘어왔을시 인증여부 판단. 입력된 아이디와 비번이 같으면인증성공
		//4-1. 인증 실패시, 아이디와 비번 입력하는 페이지로 이동(로그인 폼). 인증 실패시 비번이 잘못되었다고 가정. 다른부분 정상, 비번만 새로 입력받게 함
		if(!mem_id.equals(mem_pass)) {
			req.setAttribute("mem_id", mem_id);
			
			String url = "/login/loginForm.jsp";
 			RequestDispatcher rd = req.getRequestDispatcher(url);
 			rd.forward(req, resp);
		}else {
		//4-2. 인증 성공시, 리다이렉션. 웰컴페이지로 이동
			String location = req.getContextPath() + "/index.jsp";
			resp.sendRedirect(location);
		}
		
		
	}
}











