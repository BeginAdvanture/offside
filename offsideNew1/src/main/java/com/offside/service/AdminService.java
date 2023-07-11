package com.offside.service;

import java.util.List;

import com.offside.dto.CateVO;
import com.offside.dto.Criteria;
import com.offside.dto.GroundVO;
import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;

public interface AdminService {
	public void groundEnroll(GroundVO ground) throws Exception;

	/* 경기장 목록 */
	public List<GroundVO> groundGetList(Criteria cri) throws Exception;

	/* 경기장 총 수 */
	public int groundGetTotal(Criteria cri) throws Exception;

	/* 경기장 삭제 */
	public int groundDelete(int groundId) throws Exception;

	/* 매치 등록 */
	public void matchEnroll(MatchVO match);
	
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	
	public List<MatchVO> matchList(MatchVO match);
	public int matchDelete(int matchId) throws Exception;
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
}
