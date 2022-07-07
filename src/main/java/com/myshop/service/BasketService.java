package com.myshop.service;

import java.util.List;

import com.myshop.dto.BasketDTO;

public interface BasketService {
	//장바구니 목록
	public List<BasketDTO> BasketList(int cus_seq) throws Exception;
	
}
