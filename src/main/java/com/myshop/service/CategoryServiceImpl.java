package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.CategoryDAO;
import com.myshop.dto.CategoryDTO;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Inject
	private CategoryDAO dao;

	@Override
	public List<CategoryDTO> CategoryList() throws Exception {
		return dao.CategoryList();
	}

	@Override
	public void CategoryAdd(CategoryDTO DTO) throws Exception {
		dao.CategoryAdd(DTO);
		
	}

	@Override
	public void CategoryEdit(CategoryDTO DTO) throws Exception {
		dao.CategoryEdit(DTO);
		
	}

	@Override
	public void CategoryDel(int seq) throws Exception {
		dao.CategoryDel(seq);
		
	}
	


}
