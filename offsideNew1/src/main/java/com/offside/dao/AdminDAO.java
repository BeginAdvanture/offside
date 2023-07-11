package com.offside.dao;

import java.util.List;

import com.offside.dto.AttachImageVO;
import com.offside.dto.CateVO;
import com.offside.dto.Criteria;
import com.offside.dto.FileRequest;
import com.offside.dto.GroundVO;
import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;

public interface AdminDAO {
	public void groundEnroll(GroundVO ground);
	public List<GroundVO> groundGetList(Criteria cri);
	 /* 경기장 총 수 */
    public int groundGetTotal(Criteria cri);
    /* 경기장 삭제 */
	public int groundDelete(int groundId);
	/* 매치 등록 */
	public void matchEnroll(MatchVO match);
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO vo);
	
	public void saveAll(List<FileRequest> files);
	
	public List<MatchVO> matchList(MatchVO match);
	
	public int matchDelete(int matchId);
	
	/* 주문 상품 리스트 */
	public List<OrderDTO> getOrderList(Criteria cri);	
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	}

