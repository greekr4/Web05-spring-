package com.myshop.dto;



import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OrderLineDTO {
	private int seq;
	private int order_no;
	private String pcode;
	private String pname;
	private int price;
	private int qty;
	private String s_img_desc;
}
