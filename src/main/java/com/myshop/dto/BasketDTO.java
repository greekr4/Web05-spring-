package com.myshop.dto;


import java.util.Date;

import lombok.Data;

@Data
public class BasketDTO {
	private int seq;
	private int cus_seq;
	private String pcode;
	private int pseq;
	private int qty;
	private Date regdate;
	private String pname;
	private String psubname;
	private int price;
	private String s_img_desc;
}

