package com.myshop.service;

import java.util.List;


import com.myshop.dto.RecentlyDTO;

public interface RecentlyService {
	//최근 본 상품 리스트
	public List<RecentlyDTO> RecentlyList(int cus_seq) throws Exception;
	//최근 본 상품 추가
	public void RecentlyAdd(int cus_seq,String pcode) throws Exception;
	
}
