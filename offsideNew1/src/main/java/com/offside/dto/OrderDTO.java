package com.offside.dto;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderDTO {
	/* 주문 번호 */
	private String orderId;

	/* 주문 회원 아이디 */
	private long id;

	/* 주문 상태 */
	private String orderState;

	/* 주문 상품 */
	private List<OrderItemDTO> orders;

	/* 사용 포인트 */
	private int usePoint;

	/* 주문 날짜 */
	private Date orderDate;
	/* DB테이블 존재 하지 않는 데이터 */

	/* 판매가(모든 상품 비용) */
	private int orderSalePrice;

	/* 적립 포인트 */
	private int orderSavePoint;

	/* 최종 판매 비용 */
	private int orderFinalSalePrice;

	public void getOrderPriceInfo() { // 상품 비용 & 적립포인트
		for (OrderItemDTO order : orders) {
			orderSalePrice += order.getTotalPrice();
			orderSavePoint += order.getTotalSavePoint();
		}

		// 최종 비용(상품 비용 - 사용 포인트)
		orderFinalSalePrice = orderSalePrice - usePoint;
	}

}
