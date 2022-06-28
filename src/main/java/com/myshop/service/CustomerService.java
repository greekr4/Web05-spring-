package com.myshop.service;

import java.util.List;

import com.myshop.dto.CustomerDTO;

public interface CustomerService {
	public List<CustomerDTO> CustomerList() throws Exception;
}
