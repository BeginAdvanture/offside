package com.offside.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



public class Criteria {
    /* 현재 페이지 번호 */
    private int pageNum;
    
    /* 페이지 표시 개수 */
    private int amount;
    
    /* 검색 타입 */
    private String type;
    
    /* 검색 키워드 */
    private String keyword;
    
    /* 페이지 스킵*/
    private int skip;
    /* 상품 번호(댓글 기능에서 사용) */
	private int matchId;
    /* Criteria 생성자 */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum -1) * amount;
    }
    
    /* Criteria 기본 생성자 */
    public Criteria(){
        this(1,10);
    }
    
    /* 검색 타입 데이터 배열 변환 split은 공백제거*/
    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }

	public int getPageNum() {
		return pageNum;
	}
	/*amount와 pageNum 변수의 값이 변경될때 skip변수의 값도 변경되도록 지정.*/
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		this.skip = (pageNum -1) * this.amount;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		this.skip = (pageNum -1) * this.amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getSkip() {
		return skip;
	}

	public void setSkip(int skip) {
		this.skip = skip;
	}
	
	public int getMatchId() {
		return matchId;
	}

	public void setMatchId(int matchId) {
		this.matchId = matchId;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword
				+ ", skip=" + skip + ", matchId=" + matchId + "]";
	}

	
    
    
}
