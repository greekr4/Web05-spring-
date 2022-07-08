package com.myshop.service;

import java.util.List;
import java.util.Map;

import com.myshop.dto.BasketDTO;

public interface BasketService {
	//장바구니 목록
	public List<BasketDTO> BasketList(int cus_seq) throws Exception;
	//장바구니 추가(신규)
	public void BasketAdd(Map<String,Object> map) throws Exception;
	//장바구니 추가(업데이트)
	public void BasketEdit(Map<String,Object> map) throws Exception;
	//장바구니 체크
	public int BasketCK(Map<String,Object> map) throws Exception;
	//장바구니 삭제
	public void BasketDel(Map<String,Object> map) throws Exception;

	
}
