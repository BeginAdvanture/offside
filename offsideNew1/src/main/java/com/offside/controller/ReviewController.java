package com.offside.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.offside.dto.Criteria;
import com.offside.dto.MatchVO;
import com.offside.dto.ReplyDTO;
import com.offside.dto.ReplyPageDTO;
import com.offside.service.ReviewService;

@Controller
public class ReviewController {
	@Autowired
	private ReviewService reivewService;
	
	/* 댓글 등록 */
	@PostMapping("/enroll")
	public @ResponseBody int enrollReplyPOST(ReplyDTO dto) {
		return reivewService.enrollReply(dto);
	}
	
	/* 리뷰 쓰기 */
	@GetMapping("/replyEnroll/{id}")
	public String replyEnrollWindowGET(@PathVariable("id")long id, int matchId, Model model) {
		MatchVO match = reivewService.getMatchIdName(matchId);
		System.out.println(matchId+matchId);
		System.out.println(id+id);
		model.addAttribute("matchInfo", match);
		model.addAttribute("Id", id);
		
		return "/replyEnroll";
	}
	
	/* 댓글 체크 */
	/* Id, matchId 파라미터 */
	/* 존재 : 1 / 존재x : 0 */
	@PostMapping("/check")
	public @ResponseBody String replyCheckPOST(ReplyDTO dto) {
		System.out.println(dto);
		return reivewService.checkReply(dto);
	}
	
	/* 댓글 페이징 */
	@GetMapping(value="/list", produces = "application/json;charset=UTF-8")
	public @ResponseBody ReplyPageDTO replyListPOST(Criteria cri) {
		return reivewService.replyList(cri);
	}
	/* 댓글 삭제 */
	@PostMapping("/delete")
	public @ResponseBody void replyDeletePOST(ReplyDTO dto) {
		reivewService.deleteReply(dto);
	}
}
