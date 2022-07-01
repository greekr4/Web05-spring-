package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	private static final String namespace = "com.myshop.CustomerMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<CustomerDTO> CustomerList() throws Exception {
		return sqlSession.selectList(namespace+".CustomerList");
	}


	@Override
	public CustomerDTO CustomerLogin(CustomerDTO DTO) throws Exception {
		return sqlSession.selectOne(namespace+".CustomerLogin",DTO);
	}


	@Override
	public void CustomerJoin(CustomerDTO DTO) throws Exception {
		sqlSession.insert(namespace+".CustomerJoin",DTO);
		
	}

}