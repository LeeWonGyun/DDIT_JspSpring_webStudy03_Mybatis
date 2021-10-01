package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.mybatis.CustomSqlSessionFactoryBuilder;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberDAOImpl implements MemberDAO {
	
	private SqlSessionFactory sqlSessionFactory 
		= CustomSqlSessionFactoryBuilder.getSqlSessionFactory();
	
	@Override
	public MemberVO selectMemberForAuth(String memId) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
//			return sqlSession.selectOne("kr.or.ddit.member.dao.MemberDao.selectMemberForAuth", memId);
//			mapper proxy 생성(member.xml 의 namespace가 일치해야 함)
			MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
			return mapper.selectMemberForAuth(memId);
		}
	}

	@Override
	public int insertMember(MemberVO member) {
		
		try(
				//openSession => true 가 아니면 버퍼에 들어있는 상태에서 커밋되지 않고 session이 close 되면서 데이터가 삭제된다.
				//그러나, 트랜젝션 제어를 위해 sqlSession.commit()으로 코드 작성한다.
				//mybatis 에서 insert/update/delete 는 명시적인 트랜잭션 관리가 필요하다!
				SqlSession sqlSession = sqlSessionFactory.openSession(false);
				){
			MemberDAO  mapper = sqlSession.getMapper(MemberDAO.class);
			int cnt = mapper.insertMember(member);
			sqlSession.commit();
			return cnt;
		}
	}

	@Override
	public List<MemberVO> selectMemberList(PagingVO pagingVO) {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
			return mapper.selectMemberList(pagingVO);
		}
	}

	@Override
	public MemberVO selectMember(String memId) {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
				return mapper.selectMember(memId);
		}
	}
	
	
	@Override
	public int updateMember(MemberVO member) {
		try(
				//openSession => true 가 아니면 버퍼에 들어있는 상태에서 커밋되지 않고 session이 close 되면서 데이터가 삭제된다.
				//그러나, 트랜젝션 제어를 위해 sqlSession.commit()으로 코드 작성한다.
				//mybatis 에서 insert/update/delete 는 명시적인 트랜잭션 관리가 필요하다!
				SqlSession sqlSession = sqlSessionFactory.openSession(false);
				){
			MemberDAO  mapper = sqlSession.getMapper(MemberDAO.class);
			int cnt = mapper.updateMember(member);
			sqlSession.commit();
			return cnt;
		}
	}

	@Override
	public int deleteMember(String memId) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession(false);
		){
			MemberDAO  mapper = sqlSession.getMapper(MemberDAO.class);
			int cnt = mapper.deleteMember(memId);
			sqlSession.commit();
			return cnt;
		}
	}

	@Override
	public int selectTotalRecord(PagingVO pagingVO) {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				MemberDAO mapper = sqlSession.getMapper(MemberDAO.class);
				return mapper.selectTotalRecord(pagingVO);
		}
	}

}
