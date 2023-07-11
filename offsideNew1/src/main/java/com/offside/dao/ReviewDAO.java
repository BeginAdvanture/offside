package com.offside.dao;

import java.util.List;

import com.offside.dto.Criteria;
import com.offside.dto.MatchVO;
import com.offside.dto.ReplyDTO;

public interface ReviewDAO {
	/* 댓글 등록 */
	public int enrollReply(ReplyDTO dto);
	
	/* 상품 id 이름 */
	public MatchVO getMatchIdName(int matchId);
	/* 댓글 존재 체크 */
	public Integer checkReply(ReplyDTO dto);
	
	/* 댓글 페이징 */
	public List<ReplyDTO> getReplyList(Criteria cri);
	
	/* 댓글 총 갯수(페이징) */
	public int getReplyTotal(int matchId);
	
	/* 댓글 삭제 */
	public int deleteReply(int replyId);
}
