package com.offside.dto;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
public class ReplyPageDTO {
	List<ReplyDTO> list;

	PageDTO pageInfo;
}
