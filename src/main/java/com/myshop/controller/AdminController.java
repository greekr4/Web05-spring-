package com.myshop.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myshop.dto.CustomerDTO;
import com.myshop.service.CustomerService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/Admin/*")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	@Inject
	private CustomerService CustomerService;
	
	@Inject
	private HttpSession session;
	
	
	// JSP 연결
	
	//메뉴
	@RequestMapping("/AdminOrderList")
	public String AdminOrderList(){
		return "/Admin/AdminOrderList";
	}
	
	@RequestMapping(value = "AdminCusList", method = RequestMethod.GET)
	public String AdminCusList(Locale locale,Model model) throws Exception{
		List<CustomerDTO> List = CustomerService.CustomerList();

		model.addAttribute("List",List);
		return "/Admin/AdminCusList";
	}
		
	

}
