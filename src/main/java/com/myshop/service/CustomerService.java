package com.myshop.service;

import java.util.List;

import com.myshop.dto.CustomerDTO;

public interface CustomerService {
	//멤버리스트
	public List<CustomerDTO> CustomerList() throws Exception;
	//로그인처리
	public CustomerDTO CustomerLogin(CustomerDTO DTO) throws Exception;
	//회원가입
	public int CustomerJoin(CustomerDTO DTO) throws Exception;
}
