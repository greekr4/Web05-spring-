package com.myshop.dao;

import java.util.List;
import java.util.Map;

import com.myshop.dto.OrderDTO;
import com.myshop.dto.OrderLineDTO;

public interface OrderDAO {
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
	//오더라인 리스트
	public List<OrderLineDTO> OrderLineList(int order_no) throws Exception;
	//재고->할당재고
	public void InvtToAllocate(Map<String,Object> map) throws Exception;
	//결제 완료 (payment -> 3)
	public void UpdatePayment(int seq) throws Exception;
	//오더스텝 수정
	public void UpdateOrder(Map<String,Object> map) throws Exception;
	//오더리스트 PayOk
	public List<OrderDTO> OrderList_PayOk() throws Exception;
	//오더리스트 완료
	public List<OrderDTO> OrderList_Ok() throws Exception;
}
