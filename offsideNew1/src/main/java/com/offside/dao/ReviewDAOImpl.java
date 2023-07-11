package com.offside.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.offside.dto.Criteria;
import com.offside.dto.MatchVO;
import com.offside.dto.ReplyDTO;
@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	private SqlSession sql;
	
	
	@Override
	public int enrollReply(ReplyDTO dto) {
		return sql.insert("review.enrollReply",dto);
	}


	@Override
	public MatchVO getMatchIdName(int matchId) {
		return	sql.selectOne("review.getMatchIdName",matchId);
	}


	@Override
	public Integer checkReply(ReplyDTO dto) {
		return sql.selectOne("review.checkReply",dto);
	}


	@Override
	public List<ReplyDTO> getReplyList(Criteria cri) {
		
		return sql.selectList("review.getReplyList",cri);
	}


	@Override
	public int getReplyTotal(int matchId) {
		// TODO Auto-generated method stub
		return sql.selectOne("review.getReplyTotal",matchId);
	}


	@Override
	public int deleteReply(int replyId) {
		return sql.delete("review.deleteReply",replyId);
	}
		
}
