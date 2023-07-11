package com.offside.dto;

import java.util.Date;

import lombok.Data;
import lombok.ToString;
import lombok.Setter;
import lombok.Getter;


@ToString
public class GroundVO {
	private int groundId;
	private String groundName;
	private String nationId;
	private String nationName;
	private Date regDate;
	private Date updateDate;
	public int getGroundId() {
		return groundId;
	}
	public void setGroundId(int groundId) {
		this.groundId = groundId;
	}
	public String getGroundName() {
		return groundName;
	}
	public void setGroundName(String groundName) {
		this.groundName = groundName;
	}
	public String getNationId() {
		return nationId;
	}
	public void setNationId(String nationId) {
		this.nationId = nationId;
	    if(nationId.equals("01")) {
            this.nationName = "서울";
        }
	    else if(nationId.equals("02")) {
	    	 this.nationName = "경기도";
	    }
	    else {
            this.nationName = "인천";
        }
        
	}
	public String getNationName() {
		return nationName;
	}
	public void setNationName(String nationName) {
		this.nationName = nationName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
