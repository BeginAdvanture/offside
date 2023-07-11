package com.offside.dao;

import java.util.List;
import java.util.Map;

import com.offside.dto.MatchVO;
import com.offside.dto.Review;
import com.offside.dto.Store;


public interface StoreDAO {
	List<MatchVO> storeList(Map<String, Object> map);

	Store storeDetail(long matchId);
	
	void reviewWrite(Review review);

	List<Review> reviewList(long matchId);
	
	/* 상품 정보 */
	public MatchVO getGoodsInfo(int matchId);
	
	
	void addLikes(Map<String, Long> map);
	 
	void deleteLikes(Map<String, Long> map);

}
