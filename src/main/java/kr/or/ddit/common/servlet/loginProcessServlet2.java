package kr.or.ddit.common.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.member.service.AuthenticateService;
import kr.or.ddit.member.service.AuthenticateServiceImpl;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebServlet("/login/loginProcess.do")
public class loginProcessServlet2 extends HttpServlet{
   
	private AuthenticateService service = new AuthenticateServiceImpl();
	
	@Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //파라미터 받기 겟 파라미터
      //필수파라미터 검증 null or isempty일땐 sc 400번 senderror
      //인증 여부 확인 id 와 password가 동일하면 통과
      //인증 실패시(무조건 비밀번호가 잘못됐다고 가정) 다시 로그인폼으로 돌아갈때 이전에 입력했던 아이디는 다시 형태를 복원 dispatch 방식 이동 
      //인증이 성공한 후에는 index.jsp로 이동 redirect
      
      String id = req.getParameter("mem_id");
      String password = req.getParameter("mem_pass");
      MemberVO member = new MemberVO(id, password);
      
      log.debug("ih{}",member);
      //데이터 검증
      boolean valid = validate(member);
      String location = null;
      String message = null;
      HttpSession session = req.getSession();
      if(valid) {
         //인증
         //인증이라는 구조에서는 절대 dispatch로 이동하지 않는다
         //잘못된 요청 커맨드는 남기지 않는다
    	  ServiceResult result = service.authenticated(member);
    	  if(ServiceResult.OK.equals(result)) {
            location =  "/index.jsp";
            session.setAttribute("authMember", member);
         } else {
            location = "/login/loginForm2.jsp";
            session.setAttribute("mem_id", member.getMemId());
            if(ServiceResult.NOTEXIST.equals(result)) {
            	message = "아이디나 비밀번호가 잘못됨";
            }else {
            	message = "비번잘못. 확인요망";
            }
            
         }
      } else {
         location = "/login/loginForm2.jsp";
         message = "아이디나 비밀번호가 누락됨";
      }
      
      session.setAttribute("message", message);
      resp.sendRedirect(req.getContextPath()+ location);
            
   }


   private boolean validate(MemberVO member) {
      boolean valid = true;
      
      if(StringUtils.isBlank(member.getMemId())) {
         valid = false;
      }
      
      if(StringUtils.isBlank(member.getMemPass())) {
         valid = false;
      }
      
      return valid;
   }
}