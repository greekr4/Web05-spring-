package com.myshop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.OrderDTO;
import com.myshop.dto.OrderLineDTO;
import com.myshop.dto.RecentlyDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	private static final String namespace = "com.myshop.OrderMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<OrderDTO> OrderList() throws Exception {
		return sqlSession.selectList(namespace+".OrderList");
	}

	@Override
	public List<OrderDTO> OrderList_cus(int cus_seq) throws Exception {
		return sqlSession.selectList(namespace+".OrderList_cus",cus_seq);
	}

	@Override
	public void OrderAdd(OrderDTO DTO) throws Exception {
		sqlSession.insert(namespace+".OrderAdd",DTO);
	}

	@Override
	public int LastOrderNo() throws Exception {
		return sqlSession.selectOne(namespace+".LastOrderNo");
	}

	@Override
	public void OrderLineAdd(OrderDTO DTO) throws Exception {
		sqlSession.insert(namespace+".OrderLineAdd",DTO);
		
	}

	@Override
	public List<OrderLineDTO> OrderLineList(int order_no) throws Exception {
		return sqlSession.selectList(namespace+".OrderLineList",order_no);
	}

	@Override
	public void InvtToAllocate(Map<String, Object> map) throws Exception {
		sqlSession.update(namespace+".InvtToAllocate",map);
	}

	@Override
	public void UpdatePayment(int seq) throws Exception {
		sqlSession.update(namespace+".UpdatePayment",seq);
		
	}

	@Override
	public void UpdateOrder(Map<String, Object> map) throws Exception {
		sqlSession.update(namespace+".UpdateOrder",map);
		
	}


	
	

}
