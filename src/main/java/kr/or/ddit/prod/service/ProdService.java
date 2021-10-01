package kr.or.ddit.prod.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.PKNotFoundException;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;

/**
 * 상품관리용 Business Logic Layer
 *
 */
public interface ProdService {
	
	public ServiceResult createProd(ProdVO prod);
	/**
	 * 페이징 처리를 위한 데이터리스트 조회
	 * 동시에 totalRecord를 조회해야 함
	 * @param pagingVO
	 * @return 
	 */
	public List<ProdVO> retrieveProdList(PagingVO<ProdVO> pagingVO);
	
	/**
	 * 
	 * @param prodId
	 * @return 존재하지 않는다면, {@link PKNotFoundException}발생
	 */
	public ProdVO retrieveProd(String prodId);
	
	public ServiceResult modifyProd(ProdVO prod);
}
