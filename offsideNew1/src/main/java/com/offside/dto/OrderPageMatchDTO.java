package com.offside.dto;

import java.util.List;

public class OrderPageMatchDTO {
	/* 뷰로부터 전달받을 값 */
    private int matchId;

    
	/* DB로부터 꺼내올 값 */
    private String matchName;
    
    private int matchPrice;
    
    private double matchDiscount;
    
	/* 만들어 낼 값 */
    private int salePrice;
    
    private int totalPrice;
    
    private int point;
    
    private int totalPoint;
    
	/* 상품 이미지 */
	private List<AttachImageVO> imageList;
    
	public int getMatchId() {
		return matchId;
	}

	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}

	public String getMatchName() {
		return matchName;
	}

	public void setMatchName(String matchName) {
		this.matchName = matchName;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	
    
	@Override
	public String toString() {
		return "OrderPageMatchDTO [matchId=" + matchId + ", matchName=" + matchName + ", matchPrice=" + matchPrice
				+ ", matchDiscount=" + matchDiscount + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice
				+ ", point=" + point + ", totalPoint=" + totalPoint + ", imageList=" + imageList + "]";
	}

	public void initSaleTotal() {
		this.salePrice = (int) (this.matchPrice * (1-this.matchDiscount));
		this.totalPrice = this.salePrice;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point;
	}
}	
