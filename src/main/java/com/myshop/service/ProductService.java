package com.myshop.service;

import java.util.List;

import com.myshop.dto.ProductDTO;

public interface ProductService {
	//제품리스트
	public List<ProductDTO> ProductList() throws Exception;
	//제품리스트_카테고리검색
	public List<ProductDTO> ProductList_ccode(String ccode) throws Exception;
	//제품수_카테고리
	public int ProductCount(String ccode) throws Exception;
	
	//제품상세_고유번호
	public ProductDTO ProductMore(int seq) throws Exception;
	//제품상세_code로
	public ProductDTO ProductMore_code(String pcode) throws Exception;
	
	//--------------------------------------------------------
	//제품등록
	public void ProductAdd(ProductDTO DTO) throws Exception;
	//제품등록++이미지경로
	public void ProductAdd_add(ProductDTO DTO) throws Exception;
	//제품등록++카테고리
	public void ProductAdd_cate(ProductDTO DTO) throws Exception;
	//--------------------------------------------------------
	//제품수정
	public void ProductEdit(ProductDTO DTO) throws Exception;
	//제품수정++이미지경로
	public void ProductEdit_add(ProductDTO DTO) throws Exception;
	//제품수정++카테고리
	public void ProductEdit_cate(ProductDTO DTO) throws Exception;
	//--------------------------------------------------------
	//품목중복체크
	public ProductDTO ProductCodeCK(String pcode) throws Exception;
	//품목순번
	public int ProductPcodeOrder() throws Exception;
	//--------------------------------------------------------
	//제품삭제
	public void ProductDel(String pcode) throws Exception;
	//제품삭제
	public void ProductDel_add(String pcode) throws Exception;
	//제품삭제
	public void ProductDel_cate(String pcode) throws Exception;
	//제품삭제
	public void ProductDel_basket(String pcode) throws Exception;
	//제품삭제
	public void ProductDel_order(String pcode) throws Exception;
	
}
