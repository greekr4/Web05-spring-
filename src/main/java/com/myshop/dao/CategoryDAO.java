package com.myshop.dao;

import java.util.List;

import com.myshop.dto.CategoryDTO;

public interface CategoryDAO {
	//카테고리 리스트
	public List<CategoryDTO> CategoryList() throws Exception;
	//추가
	public void CategoryAdd(CategoryDTO DTO) throws Exception;
	//수정
	public void CategoryEdit(CategoryDTO DTO) throws Exception;
	//삭제
	public void CategoryDel(int seq) throws Exception;
}
