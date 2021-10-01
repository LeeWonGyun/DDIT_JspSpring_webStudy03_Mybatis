package kr.or.ddit.member.service;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.common.servlet.PKNotFoundException;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.CustomException;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO dao = new MemberDAOImpl();
	private AuthenticateService authService = new AuthenticateServiceImpl();
	
	@Override
	public ServiceResult createMember(MemberVO member) {
		ServiceResult result = null;
		//중복여부 검증
		if(dao.selectMember(member.getMemId())==null) {
			int rowcnt = dao.insertMember(member);
			if(rowcnt>0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else {
			result = ServiceResult.PKDUPLICATED;
		}
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList(PagingVO pagingVO) {
		int totalRecord = dao.selectTotalRecord(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		List<MemberVO> memberList = dao.selectMemberList(pagingVO);
		
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String memId) {
		//값이 존재하지 않으면 custom exception 발생시키기
		MemberVO member = dao.selectMember(memId);
		if(member == null) {
			throw new PKNotFoundException(memId+"에 해당하는 회원 없음");
		}
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		ServiceResult result = authService.authenticated(member);
		if(ServiceResult.OK.equals(result)) {//인증성공
			int rowcnt = dao.updateMember(member);
			if(rowcnt>0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else if(ServiceResult.NOTEXIST.equals(result)){
			throw new PKNotFoundException(member.getMemId() + "해당 회원이 없음");
		}
		return result;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		ServiceResult result = authService.authenticated(member);
		if(ServiceResult.OK.equals(result)) {//인증성공
			int rowcnt = dao.deleteMember(member.getMemId());
			if(rowcnt>0) {
				result = ServiceResult.OK;
			}else {
				result = ServiceResult.FAILED;
			}
		}else if(ServiceResult.NOTEXIST.equals(result)){
			throw new PKNotFoundException(member.getMemId() + "해당 회원이 없음");
		}
		return result;
	}


}
