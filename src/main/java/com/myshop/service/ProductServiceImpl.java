package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Override
	public void ProductAdd(ProductDTO DTO) throws Exception {
		dao.ProductAdd(DTO);
		
	}

	@Override
	public void ProductAdd_add(ProductDTO DTO) throws Exception {
		dao.ProductAdd_add(DTO);
		
	}

	@Override
	public void ProductAdd_cate(ProductDTO DTO) throws Exception {
		dao.ProductAdd_cate(DTO);
		
	}

	@Override
	public void ProductEdit(ProductDTO DTO) throws Exception {
		dao.ProductEdit(DTO);
		
	}

	@Override
	public void ProductEdit_add(ProductDTO DTO) throws Exception {
		dao.ProductEdit_add(DTO);
		
	}

	@Override
	public void ProductEdit_cate(ProductDTO DTO) throws Exception {
		dao.ProductEdit_cate(DTO);
		
	}

	@Override
	public List<ProductDTO> ProductList_ccode(String ccode) throws Exception {
		return dao.ProductList_ccode(ccode);
	}

	@Override
	public int ProductCount(String ccode) throws Exception {
		return dao.ProductCount(ccode);
	}

	@Override
	public void ProductDel(String pcode) throws Exception {
		dao.ProductDel(pcode);
	}

	@Override
	public void ProductDel_add(String pcode) throws Exception {
		dao.ProductDel_add(pcode);
	}

	@Override
	public void ProductDel_cate(String pcode) throws Exception {
		dao.ProductDel_cate(pcode);
	}

	@Override
	public void ProductDel_basket(String pcode) throws Exception {
		dao.ProductDel_basket(pcode);
	}

	@Override
	public void ProductDel_order(String pcode) throws Exception {
		dao.ProductDel_order(pcode);
	}

	@Override
	public ProductDTO ProductCodeCK(String pcode) throws Exception {
		return dao.ProductCodeCK(pcode);
	}

	@Override
	public int ProductPcodeOrder() throws Exception {
		return dao.ProductPcodeOrder();
	}


	
	

}
