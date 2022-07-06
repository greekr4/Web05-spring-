package com.myshop.dao;

import java.util.List;

import com.myshop.dto.RecentlyDTO;

public interface RecentlyDAO {
	//최근 본 상품 리스트
	public List<RecentlyDTO> RecentlyList(int cus_seq) throws Exception;

	
}
