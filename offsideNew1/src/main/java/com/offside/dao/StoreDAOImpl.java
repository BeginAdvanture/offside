package com.offside.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.offside.dto.MatchVO;
import com.offside.dto.Review;
import com.offside.dto.Store;

@Repository
public class StoreDAOImpl implements StoreDAO{
	@Autowired
	private SqlSession sql;
	
	@Override
	public List<MatchVO> storeList(Map<String, Object> map) {
		return sql.selectList("store.storeList", map);
	}
	
	
	@Override
	public Store storeDetail(long matchId) {
		return sql.selectOne("store.storeDetail", matchId);
	}
	
	@Override
	public void reviewWrite(Review review) {
		sql.insert("store.reviewWrite", review);
	}
	
	@Override
	public List<Review> reviewList(long id) {
		return sql.selectList("store.reviewList", id);
	}


	@Override
	public MatchVO getGoodsInfo(int matchId) {
		
		return sql.selectOne("store.getGoodsInfo",matchId);
	}



	@Override
	public void addLikes(Map<String, Long> map) {
	    sql.insert("store.addLikes", map);
	}
	 
	@Override
	public void deleteLikes(Map<String, Long> map) {
	    sql.insert("store.deleteLikes", map);
	}
	
	
}
