package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.ProductDAO;
import com.myshop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	@Inject
	private ProductDAO dao;

	@Override
	public List<ProductDTO> ProductList() throws Exception {
		return dao.ProductList();
	}

	@Override
	public ProductDTO ProductMore(int seq) throws Exception {
		return dao.ProductMore(seq);
	}
	
	

}
