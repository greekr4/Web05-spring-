package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CustomerDTO;
import com.myshop.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	private static final String namespace = "com.myshop.CustomerMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<ProductDTO> ProductList() throws Exception {
		return sqlSession.selectList(namespace+".ProductList");
	}

	@Override
	public ProductDTO ProductMore(int seq) throws Exception {
		return sqlSession.selectOne(namespace+".ProductMore",seq);
	}
	
	
	

}
