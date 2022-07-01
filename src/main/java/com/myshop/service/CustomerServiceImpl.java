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
	public CustomerDTO CustomerLogin(CustomerDTO DTO) throws Exception {
		return dao.CustomerLogin(DTO);
	}

	@Override
	public void CustomerJoin(CustomerDTO DTO) throws Exception {
		dao.CustomerJoin(DTO);
		
	}

}
