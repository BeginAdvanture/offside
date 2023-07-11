package com.offside.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offside.dao.StoreDAO;
import com.offside.dto.MatchVO;
import com.offside.dto.Review;
import com.offside.dto.Store;
import com.offside.dto.StoreDetail;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDAO storeDAO;

	@Override
	public List<MatchVO> storeList(int category, int address) {

		Map<String, Object> map = new HashMap<>();
		map.put("category", category);
		map.put("address1", address);

		return storeDAO.storeList(map);
	}
	@Override
	public StoreDetail storeDetail(long matchId) {
		Store storeInfo = storeDAO.storeDetail(matchId); 
		System.out.println(matchId);
//		List<Food> foodList = storeDAO.foodList(storeId);
		List<Review> reviewList = storeDAO.reviewList(matchId);
		
		return new StoreDetail(storeInfo,reviewList);
	}
	
	@Override
	public void reviewWrite(Review review) {
		storeDAO.reviewWrite(review);
	}
	@Override
	public MatchVO getGoodsInfo(int matchId) {
		
		return storeDAO.getGoodsInfo(matchId);
	}
	@Override
	public void likes(long Id, String likes, long matchId) {
	    Map<String, Long> map = new HashMap<>();
	    map.put("matchId", matchId);
	    map.put("Id", Id);
	    
	    if(likes.equals("on")) {
	        storeDAO.addLikes(map);
	    } else {
	        storeDAO.deleteLikes(map);
	    }
	    
	}
	
	
}
