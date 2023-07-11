package com.offside.service;

import com.offside.dto.Criteria;
import com.offside.dto.MatchVO;
import com.offside.dto.ReplyDTO;
import com.offside.dto.ReplyPageDTO;

public interface ReviewService {
	/* 댓글 등록 */
	public int enrollReply(ReplyDTO dto);
	
	/* 상품 id 이름 */
	public MatchVO getMatchIdName(int matchId);
	
	/* 댓글 존재 체크 */
	public String checkReply(ReplyDTO dto);
	/* 댓글 페이징 */
	public ReplyPageDTO replyList(Criteria cri);
	
	/* 댓글 삭제 */
	public int deleteReply(ReplyDTO dto);
}
