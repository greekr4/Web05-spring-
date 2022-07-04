package com.myshop.service;

import java.util.List;

import com.myshop.dto.CustomerDTO;

public interface CustomerService {
	//멤버리스트
	public List<CustomerDTO> CustomerList() throws Exception;
	//로그인처리
	public CustomerDTO CustomerInfo(CustomerDTO DTO) throws Exception;
	//회원가입
	public int CustomerJoin(CustomerDTO DTO) throws Exception;
	//정보수정
	public void CustomerEdit(CustomerDTO DTO) throws Exception;
	//삭제
	public void CustomerDel(int seq) throws Exception;
	//로그인카운트
	public void CustomerLoginCnt(CustomerDTO DTO) throws Exception;
	//로그인데이트
	public void CustomerLoginDate(CustomerDTO DTO) throws Exception;
	//검색_이름
	public List<CustomerDTO> CustomerList_Search_name(String name) throws Exception; 
	//검색_이메일(아이디)
	public List<CustomerDTO> CustomerList_Search_email(String email) throws Exception; 
	//검색_폰번호
	public List<CustomerDTO> CustomerList_Search_phonenum(String phonenum) throws Exception; 
}
