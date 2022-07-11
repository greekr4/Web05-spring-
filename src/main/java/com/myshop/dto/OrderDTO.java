package com.myshop.dto;


import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private int seq;
	private int order_no;
	private int order_step;
	private String order_val;
	private int payment_status;
	private String payment_val;
	private int price;
	private int use_point;
	private int save_point;
	private int total_price;
	private int cus_seq;
	private String delivery_cus;
	private String delivery_addr1;
	private String delivery_addr2;
	private String delivery_zipcode;
	private String delivery_memo;
	private Date regdate;
	private String pcode;
	private int qty;
	
}
