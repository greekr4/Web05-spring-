package com.myshop.dao;

import java.util.List;

import com.myshop.dto.CustomerDTO;

public interface CustomerDAO {
	//멤버리스트
	public List<CustomerDTO> CustomerList() throws Exception;
	//로그인처리
	public CustomerDTO CustomerInfo(CustomerDTO DTO) throws Exception;
	//회원가입
	public int CustomerJoin(CustomerDTO DTO) throws Exception;
	//로그인카운트
	public void CustomerLoginCnt(CustomerDTO DTO) throws Exception;
	//로그인데이트
	public void CustomerLoginDate(CustomerDTO DTO) throws Exception;
}
