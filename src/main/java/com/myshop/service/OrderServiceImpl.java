package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.OrderDAO;
import com.myshop.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {
	@Inject
	private OrderDAO dao;

	@Override
	public List<OrderDTO> OrderList() throws Exception {
		return dao.OrderList();
	}

	@Override
	public List<OrderDTO> OrderList_cus(int cus_seq) throws Exception {
		return dao.OrderList_cus(cus_seq);
	}

	@Override
	public void OrderAdd(OrderDTO DTO) throws Exception {
		dao.OrderAdd(DTO);
	}

	@Override
	public int LastOrderNo() throws Exception {
		return dao.LastOrderNo();
	}

	@Override
	public void OrderLineAdd(OrderDTO DTO) throws Exception {
		dao.OrderLineAdd(DTO);
		
	}


	

}
