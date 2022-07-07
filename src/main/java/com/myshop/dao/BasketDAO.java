package com.myshop.dao;

import java.util.List;

import com.myshop.dto.BasketDTO;

public interface BasketDAO {
	//장바구니 목록
	public List<BasketDTO> BasketList(int cus_seq) throws Exception;


	
}
