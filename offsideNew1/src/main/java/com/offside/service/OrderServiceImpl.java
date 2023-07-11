package com.offside.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.offside.dao.OrderDAO;
import com.offside.dao.StoreDAO;
import com.offside.dao.UserDAO;
import com.offside.dto.MatchVO;
import com.offside.dto.OrderDTO;
import com.offside.dto.OrderItemDTO;
import com.offside.dto.OrderPageMatchDTO;
import com.offside.dto.User;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private StoreDAO storeDAO;
	@Autowired
	private UserDAO userDAO;

	@Override
	public List<OrderPageMatchDTO> getMatchInfo(List<OrderPageMatchDTO> orders) {
	    List<OrderPageMatchDTO> result = new ArrayList<>();

	    for (OrderPageMatchDTO ord : orders) {
	        OrderPageMatchDTO matchInfo = orderDAO.getMatchInfo(ord.getMatchId());

	        if (matchInfo != null) {
	            matchInfo.initSaleTotal();
	            result.add(matchInfo);
	        }
	    }

	    return result;
	}


	@Override
	public User getMemberInfo(long id) {

		return orderDAO.getMemberInfo(id);
	}

	@Override
	@Transactional
	public void order(OrderDTO ord) {
		
		// memberId를 활용하여 필요한 로직을 수행합니다.
		User user = orderDAO.getMemberInfo(ord.getId());
		List<OrderItemDTO> ords = new ArrayList<>();
		
		// DB 주문
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = user.getId() + format.format(date);
		System.out.println(orderId);

		ord.setOrderId(orderId);
	
		orderDAO.enrollOrder(ord); // order 등록

		for (OrderItemDTO oit : ord.getOrders()) {
			oit.setOrderId(orderId);
			orderDAO.enrollOrderItem(oit);
		}

		// 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용
		int calPoint = user.getPoint();
		calPoint = calPoint - ord.getUsePoint() + ord.getOrderSavePoint();
		// 기존 포인트 - 사용 포인트 + 획득 포인트
		user.setPoint(calPoint);

		// 인원 변동 적용
		for (OrderItemDTO oit : ord.getOrders()) {
			// 변동 값 구하기
			MatchVO match = storeDAO.getGoodsInfo(oit.getMatchId());
			System.out.println(match);
			match.setMatchStock(match.getMatchStock()-1);
			// 변동 값 DB 적용
			orderDAO.deductStock(match);
		}
	
	}

}
