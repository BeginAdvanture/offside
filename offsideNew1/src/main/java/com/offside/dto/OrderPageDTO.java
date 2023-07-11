package com.offside.dto;

import java.util.List;

public class OrderPageDTO {
	private List<OrderPageMatchDTO> orders;

	public List<OrderPageMatchDTO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderPageMatchDTO> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	
	
}
