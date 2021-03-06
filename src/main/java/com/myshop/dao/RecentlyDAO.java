package com.myshop.dao;

import java.util.List;

import com.myshop.dto.RecentlyDTO;

public interface RecentlyDAO {
	//최근 본 상품 리스트
	public List<RecentlyDTO> RecentlyList(int cus_seq) throws Exception;
	//최근 본 상품 추가
	public void RecentlyAdd(int cus_seq,String pcode) throws Exception;
	//최근 본 상품 삭제(중복 방지)
	public void RecentlyDel(int cus_seq,String pcode) throws Exception;
	
}
