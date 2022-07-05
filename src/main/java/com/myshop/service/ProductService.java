package com.myshop.service;

import java.util.List;

import com.myshop.dto.ProductDTO;

public interface ProductService {
	//리스트
	public List<ProductDTO> ProductList() throws Exception;
	//제품상세
	public ProductDTO ProductMore(int seq) throws Exception;
}
