package com.offside.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;
import com.offside.dto.OrderItemDTO;
import com.offside.dto.OrderPageMatchDTO;
import com.offside.dto.User;

@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	private SqlSession sql;
	
	
	@Override
	public OrderPageMatchDTO getMatchInfo(int matchId) {
		
		return sql.selectOne("Order.getMatchInfo",matchId);
	}


	@Override
	public User getMemberInfo(long id) {
		
		return sql.selectOne("Order.getMemberInfo",id);
	}


	@Override
	public OrderItemDTO getOrderInfo(int matchId) {
		// TODO Auto-generated method stub
		return sql.selectOne("Order.getOrderInfo", matchId);
	}


	@Override
	public int enrollOrder(OrderDTO ord) {
		// TODO Auto-generated method stub
		return sql.insert("Order.enrollOrder",ord);
	}


	@Override
	public int enrollOrderItem(OrderItemDTO orid) {
		// TODO Auto-generated method stub
		return sql.insert("Order.enrollOrderItem",orid);
	}


	/*
	 * @Override public int deductMoney(User user) { // TODO Auto-generated method
	 * stub return 0; }
	 */


	@Override
	public int deductStock(MatchVO match) {
		// TODO Auto-generated method stub
		return sql.update("Order.deductStock",match);
	}
	
}
