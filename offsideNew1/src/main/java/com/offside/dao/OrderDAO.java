package com.offside.dao;

import java.util.List;

import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;
import com.offside.dto.OrderItemDTO;
import com.offside.dto.OrderPageMatchDTO;
import com.offside.dto.User;

public interface OrderDAO {
	/* 주문 상품 정보 */	
	public OrderPageMatchDTO getMatchInfo(int matchId);
	/* 주문자 정보 */
	public User getMemberInfo(long id);
	
	/* 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getOrderInfo(int matchId);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	
	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	
	/* 주문 금액 차감
	public int deductMoney(User user); */
	
	/* 주문 재고 차감 */
	public int deductStock(MatchVO match);
}
