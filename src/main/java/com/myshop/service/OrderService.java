package com.myshop.service;

import java.util.List;

import com.myshop.dto.OrderDTO;

public interface OrderService {
	//오더리스트
	public List<OrderDTO> OrderList() throws Exception;
	//오더리스트(회원)
	public List<OrderDTO> OrderList_cus(int cus_seq) throws Exception;
	//오더추가
	public void OrderAdd(OrderDTO DTO) throws Exception;
	//라스트오더번호
	public int LastOrderNo() throws Exception;
	//오더라인 추가
	public void OrderLineAdd(OrderDTO DTO) throws Exception;
}
