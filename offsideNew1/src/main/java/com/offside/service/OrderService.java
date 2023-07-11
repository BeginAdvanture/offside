package com.offside.service;

import java.util.List;

import com.offside.dto.OrderDTO;
import com.offside.dto.OrderPageMatchDTO;
import com.offside.dto.User;

public interface OrderService {
	/* 주문 정보 */
	public List<OrderPageMatchDTO> getMatchInfo(List<OrderPageMatchDTO> orders);
	
	
	/* 주문자 정보 */
	public User getMemberInfo(long id);
	
	/* 주문 */
	public void  order(OrderDTO orw);
	
	
}
