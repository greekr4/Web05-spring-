package com.myshop.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {
	private int seq;
	private int cus_seq;
	private int type;
	private String title;
	private String content;
	private int cnt;
	private int rec;
	private int qna_code;
	private int qna_seq;
	private Date regdate;
	private String name;
	private String email;
	private int reply_cnt;
	private int p_seq;
	private int star;
							
							

}
