package com.offside.service;

import java.util.List;

import com.offside.dto.MatchVO;
import com.offside.dto.Review;
import com.offside.dto.StoreDetail;

public interface StoreService {
	List<MatchVO> storeList(int category, int address);
	
	StoreDetail storeDetail(long matchId);
	
	void reviewWrite(Review review);
	
	/* 상품 정보 */
	public MatchVO getGoodsInfo(int matchId);
	
	// 찜
	void likes(long matchId, String likes,long Id);
	
}
