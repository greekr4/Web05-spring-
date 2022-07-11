package com.myshop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.OrderDTO;
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


	
	

}
