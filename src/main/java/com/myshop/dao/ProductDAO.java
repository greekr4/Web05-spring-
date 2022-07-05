package com.myshop.dao;

import java.util.List;

import com.myshop.dto.ProductDTO;

public interface ProductDAO {
	//리스트
	public List<ProductDTO> ProductList() throws Exception;
	//제품상세
	public ProductDTO ProductMore(int seq) throws Exception;
}
