package com.myshop.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReCommentDTO {
	private int seq;
	private int cus_seq;
	private int comment_seq;
	private String content;
	private int rec;
	private Date regdate;
	private String name;
	private String email;
}
