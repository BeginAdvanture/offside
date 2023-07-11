package com.offside.dto;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class MatchVO {
	/* 매치 id */
	private int matchId;
	
	/* 매치 이름 */
	private String matchName;
	
	/* 경기장 id */
	private int groundId;
	
	/* 경기장 이름 */
	private String groundName;
	
	/* 매치 데이 */
	private String matchDate;
	
	/* 경기 관리자 */
	private String matchOwner;
	
	/* 카테고리 코드 */
	private String cateCode;
	
	/* 카테고리 이름 */
	private String cateName;
	
	/* 매치 가격 */
	private int matchPrice;
	
	/* 매치 정원 */
	private int matchStock;
	
	/* 매치 할인률(백분율) */
	private double matchDiscount;
	
	/* 매치 소개 */
	private String matchIntro;
	
	/* 매치 목차 */
	private String matchContents;
	
	/* 등록 날짜 */
	private Date regDate;
	
	/* 수정 날짜 */
	private Date updateDate;
	
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	
	private String address1;
	private String address2;
	private String address3;
	private int category;
}
