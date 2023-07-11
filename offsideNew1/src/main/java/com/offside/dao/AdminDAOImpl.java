package com.offside.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.offside.dto.AttachImageVO;
import com.offside.dto.CateVO;
import com.offside.dto.Criteria;
import com.offside.dto.FileRequest;
import com.offside.dto.GroundVO;
import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;
@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	private SqlSession sql;
	
	@Override
	public void groundEnroll(GroundVO ground) {
		sql.insert("admin.enroll" , ground);	
		
	}

	@Override
	public List<GroundVO> groundGetList(Criteria cri) {
		
		return sql.selectList("admin.groundGetList",cri);
	}

	@Override
	public int groundGetTotal(Criteria cri) {
	
		return sql.selectOne("admin.groundGetTotal",cri);
	}

	@Override
	public int groundDelete(int groundId) {
		return sql.delete("admin.groundDelete",groundId);
	}

	@Override
	public void matchEnroll(MatchVO match) {
		sql.insert("admin.matchEnroll",match);
	}

	@Override
	public List<CateVO> cateList() {
		return sql.selectList("admin.cateList");
	}

	@Override
	public void imageEnroll(AttachImageVO vo) {
		sql.insert("admin.imageEnroll",vo);
		
	}

	@Override
	public void saveAll(List<FileRequest> files) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<MatchVO> matchList(MatchVO match) {
		return sql.selectList("admin.matchList", match);
		
	}

	@Override
	public int matchDelete(int matchId) {
		
		return sql.delete("admin.matchDelete",matchId);
	}

	@Override
	public List<OrderDTO> getOrderList(Criteria cri) {
		// TODO Auto-generated method stub
		return sql.selectList("admin.getOrderList",cri);
	}

	@Override
	public int getOrderTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return sql.selectOne("admin.getOrderTotal",cri);
	}
	
	
}
