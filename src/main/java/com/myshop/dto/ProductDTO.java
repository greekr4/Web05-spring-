package com.myshop.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductDTO {
	private int seq;
	private String pcode;
	private int state;
	private String state_val;
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
}
