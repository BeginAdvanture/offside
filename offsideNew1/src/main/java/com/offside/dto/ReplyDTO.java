package com.offside.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Setter
@Getter

public class ReplyDTO {
	private int replyId;

	private int matchId;

	private long id;
	@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date regDate;

	private String content;

	private double rating;
}

