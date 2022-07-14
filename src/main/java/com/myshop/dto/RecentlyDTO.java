package com.myshop.dto;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RecentlyDTO {
	private int seq;
	private int cus_seq;
	private int p_seq;
	private String vp;
	private String value;
	private String s_img_desc;
}
