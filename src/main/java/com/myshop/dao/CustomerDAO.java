package com.myshop.dao;

import java.util.List;

import com.myshop.dto.CustomerDTO;

public interface CustomerDAO {

	public List<CustomerDTO> CustomerList() throws Exception;
}
