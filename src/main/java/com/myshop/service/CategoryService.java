package com.myshop.service;

import java.util.List;

import com.myshop.dto.CategoryDTO;


public interface CategoryService {
	//카테고리 리스트
	public List<CategoryDTO> CategoryList() throws Exception;
}
