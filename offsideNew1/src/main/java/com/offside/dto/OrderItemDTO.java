package com.offside.dto;

public class OrderItemDTO {
	/* 주문 번호 */
	private String orderId;
	
	/* 상품 번호 */
    private int matchId;

    
    private int orderItemId;
    
	/* 상품 한 개 가격 */
    private int matchPrice;
    
	/* 상품 할인 율 */
    private double matchDiscount;
    
	/* 상품 한개 구매 시 획득 포인트 */
    private int savePoint;
    
	/* DB테이블 존재 하지 않는 데이터 */
    
	/* 할인 적용된 가격 */
    private int salePrice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalPrice;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalSavePoint;

	

	@Override
	public String toString() {
		return "OrderItemDTO [orderId=" + orderId + ", matchId=" + matchId + ", orderItemId=" + orderItemId
				+ ", matchPrice=" + matchPrice + ", matchDiscount=" + matchDiscount + ", savePoint=" + savePoint
				+ ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + ", totalSavePoint=" + totalSavePoint
				+ "]";
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getMatchId() {
		return matchId;
	}

	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}



	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getMatchPrice() {
		return matchPrice;
	}

	public void setMatchPrice(int matchPrice) {
		this.matchPrice = matchPrice;
	}

	public double getMatchDiscount() {
		return matchDiscount;
	}

	public void setMatchDiscount(double matchDiscount) {
		this.matchDiscount = matchDiscount;
	}

	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalSavePoint() {
		return totalSavePoint;
	}

	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}
	public void initSaleTotal() {
		this.salePrice = (int) (this.matchPrice * (1-this.matchDiscount));
		this.totalPrice = this.salePrice;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint =this.savePoint ;
	}
    
}
