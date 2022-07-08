package com.myshop.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.BasketDAO;
import com.myshop.dto.BasketDTO;

@Service
public class BasketServiceImpl implements BasketService {
	@Inject
	private BasketDAO dao;

	@Override
	public List<BasketDTO> BasketList(int cus_seq) throws Exception {
		return dao.BasketList(cus_seq);
	}

	@Override
	public void BasketAdd(Map<String, Object> map) throws Exception {
		dao.BasketAdd(map);
		
	}



	

}
