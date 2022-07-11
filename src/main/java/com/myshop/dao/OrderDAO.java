package com.myshop.dao;

import java.util.List;

import com.myshop.dto.OrderDTO;

public interface OrderDAO {
	//오더리스트
	public List<OrderDTO> OrderList() throws Exception;
	//오더리스트(회원)
	public List<OrderDTO> OrderList_cus(int cus_seq) throws Exception;
	//오더추가
	public void OrderAdd(OrderDTO DTO) throws Exception;
}
