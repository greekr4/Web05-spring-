package com.myshop.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int seq;
	private String pcode;
	private int state;
	private String state_name;
	private String pname;
	private String psubname;
	private int price;
	private int invt;
	private int allocate_invt;
	private int discount;
	private String unit;
	private String pdetail;
	private String origin;
	private String weight;
	private String guidelines;
	private Date regdate;
	
	private String s_img_desc;
	private String ds_img_desc;
	private String dm_img_desc;
	
	private String ccode;
	
	private int qty;
}
