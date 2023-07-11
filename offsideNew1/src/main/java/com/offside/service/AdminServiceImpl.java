package com.offside.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.offside.dao.AdminDAO;
import com.offside.dto.AttachImageVO;
import com.offside.dto.CateVO;
import com.offside.dto.Criteria;
import com.offside.dto.GroundVO;
import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void groundEnroll(GroundVO ground) throws Exception {
		adminDAO.groundEnroll(ground);
	}

	@Override
	public List<GroundVO> groundGetList(Criteria cri) throws Exception {
		return adminDAO.groundGetList(cri);
	}

	@Override
	public int groundGetTotal(Criteria cri) throws Exception {
		return adminDAO.groundGetTotal(cri);
	}

	@Override
	public int groundDelete(int groundId) throws Exception {
		return adminDAO.groundDelete(groundId);
	}

	@Transactional
	@Override
	public void matchEnroll(MatchVO match) {
		adminDAO.matchEnroll(match);
		
		if(match.getImageList() == null || match.getImageList().size() <= 0) {
			return;
		}
		match.getImageList().forEach(attach ->{
			
			attach.setMatchId(match.getMatchId());
			adminDAO.imageEnroll(attach);
			
		});
	}

	@Override
	public List<CateVO> cateList() {
		return adminDAO.cateList();
	}

	@Override
	public List<MatchVO> matchList(MatchVO match) {
		return adminDAO.matchList(match);
		
	}

	@Override
	public int matchDelete(int matchId) throws Exception {
		
		return adminDAO.matchDelete(matchId);
	}

	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		// TODO Auto-generated method stub
		return adminDAO.getOrderList(cri);
	}

	@Override
	public int getOrderTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return adminDAO.getOrderTotal(cri);
	}
	
	
}
