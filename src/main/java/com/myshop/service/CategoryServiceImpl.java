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
	


}
