package com.myshop.dto;



import lombok.Data;

@Data
public class OrderLineDTO {
	private int seq;
	private int order_no;
	private String pcode;
	private String pname;
	private int price;
	private int qty;
	
}
