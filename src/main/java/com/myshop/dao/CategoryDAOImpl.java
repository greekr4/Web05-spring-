package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CategoryDTO;
import com.myshop.dto.CustomerDTO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {
	private static final String namespace = "com.myshop.CategoryMapper";
	
	@Inject
	private SqlSession sqlSession;
	

	@Override
	public List<CategoryDTO> CategoryList() throws Exception {
		return sqlSession.selectList(namespace+".CategoryList");
	}


	@Override
	public void CategoryAdd(CategoryDTO DTO) throws Exception {
		sqlSession.insert(namespace+".CategoryAdd",DTO);
		
	}


	@Override
	public void CategoryEdit(CategoryDTO DTO) throws Exception {
		sqlSession.update(namespace+".CategoryEdit",DTO);
		
	}


	@Override
	public void CategoryDel(int seq) throws Exception {
		sqlSession.delete(namespace+".CategoryDel",seq);
		
	}

}
