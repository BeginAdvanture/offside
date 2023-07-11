package com.offside.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offside.dao.ReviewDAO;
import com.offside.dto.Criteria;
import com.offside.dto.MatchVO;
import com.offside.dto.PageDTO;
import com.offside.dto.ReplyDTO;
import com.offside.dto.ReplyPageDTO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public int enrollReply(ReplyDTO dto) {
		int result = reviewDAO.enrollReply(dto);

		return result;
	}

	@Override
	public MatchVO getMatchIdName(int matchId) {
		return reviewDAO.getMatchIdName(matchId);
	}

	@Override
	public String checkReply(ReplyDTO dto) {
		Integer result = reviewDAO.checkReply(dto);
		System.out.println(result);
		if (result == null) {
			
			return "0";
		} else {
			return "1";
		}
		
	}
	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();
		
		dto.setList(reviewDAO.getReplyList(cri));
		dto.setPageInfo(new PageDTO(cri, reviewDAO.getReplyTotal(cri.getMatchId())));
		
		return dto;
	}
	@Override
	public int deleteReply(ReplyDTO dto) {
		
		int result = reviewDAO.deleteReply(dto.getReplyId()); 
		
		return result;
	}
}
