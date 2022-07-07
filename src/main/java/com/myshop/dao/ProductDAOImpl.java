package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CustomerDTO;
import com.myshop.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	private static final String namespace = "com.myshop.ProductMapper";
	
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

	@Override
	public void ProductAdd(ProductDTO DTO) throws Exception {
		sqlSession.insert(namespace+".ProductAdd",DTO);
		
	}

	@Override
	public void ProductAdd_add(ProductDTO DTO) throws Exception {
		sqlSession.insert(namespace+".ProductAdd_add",DTO);
		
	}

	@Override
	public void ProductAdd_cate(ProductDTO DTO) throws Exception {
		sqlSession.insert(namespace+".ProductAdd_cate",DTO);
		
	}

	@Override
	public void ProductEdit(ProductDTO DTO) throws Exception {
		sqlSession.update(namespace+".ProductEdit",DTO);
	}

	@Override
	public void ProductEdit_add(ProductDTO DTO) throws Exception {
		sqlSession.update(namespace+".ProductEdit_add",DTO);
	}

	@Override
	public void ProductEdit_cate(ProductDTO DTO) throws Exception {
		sqlSession.update(namespace+".ProductEdit_cate",DTO);
	}

	@Override
	public List<ProductDTO> ProductList_ccode(String ccode) throws Exception {
		return sqlSession.selectList(namespace+".ProductList_ccode",ccode);
	}

	@Override
	public int ProductCount(String ccode) throws Exception {
		return sqlSession.selectOne(namespace+".ProductCount",ccode);
	}

	@Override
	public void ProductDel(String pcode) throws Exception {
		sqlSession.delete(namespace+".ProductDel",pcode);
	}

	@Override
	public void ProductDel_add(String pcode) throws Exception {
		sqlSession.delete(namespace+".ProductDel_add",pcode);
	}

	@Override
	public void ProductDel_cate(String pcode) throws Exception {
		sqlSession.delete(namespace+".ProductDel_cate",pcode);
	}

	@Override
	public void ProductDel_basket(String pcode) throws Exception {
		sqlSession.delete(namespace+".ProductDel_basket",pcode);
	}

	@Override
	public void ProductDel_order(String pcode) throws Exception {
		sqlSession.delete(namespace+".ProductDel_order",pcode);
	}

	@Override
	public ProductDTO ProductCodeCK(String pcode) throws Exception {
		return sqlSession.selectOne(namespace+".ProductCodeCK",pcode);
	}
	
	
	

}
