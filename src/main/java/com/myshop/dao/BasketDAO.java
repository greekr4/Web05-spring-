package com.myshop.dao;

import java.util.List;
import java.util.Map;

import com.myshop.dto.BasketDTO;

public interface BasketDAO {
	//장바구니 목록
	public List<BasketDTO> BasketList(int cus_seq) throws Exception;
	//장바구니 추가
	public void BasketAdd(Map<String,Object> map) throws Exception;

	
}
