package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.CustomerDAO;
import com.myshop.dto.CustomerDTO;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Inject
	private CustomerDAO dao;
	
	@Override
	public List<CustomerDTO> CustomerList() throws Exception {
		return dao.CustomerList();
	}

	@Override
	public CustomerDTO CustomerInfo(CustomerDTO DTO) throws Exception {
		return dao.CustomerInfo(DTO);
	}

	@Override
	public int CustomerJoin(CustomerDTO DTO) throws Exception {
		return dao.CustomerJoin(DTO);
		
	}

	@Override
	public void CustomerLoginCnt(CustomerDTO DTO) throws Exception {
		dao.CustomerLoginCnt(DTO);
		
	}

	@Override
	public void CustomerLoginDate(CustomerDTO DTO) throws Exception {
		dao.CustomerLoginDate(DTO);
		
	}

}
