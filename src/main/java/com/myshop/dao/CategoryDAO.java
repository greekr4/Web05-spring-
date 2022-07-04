package com.myshop.dao;

import java.util.List;

import com.myshop.dto.CategoryDTO;

public interface CategoryDAO {
	//카테고리 리스트
	public List<CategoryDTO> CategoryList() throws Exception;

}
