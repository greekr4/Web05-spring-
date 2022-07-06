package com.myshop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.ProductDTO;
import com.myshop.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/Product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
		
	@Inject
	private ProductService service;
	
	@Inject
	private HttpSession session;
	
	
	// JSP 연결
	
	//메뉴
	@RequestMapping("/Products")
	public String LoginForm(Model model,@RequestParam String ccode) throws Exception{
		List<ProductDTO> List = service.ProductList_ccode(ccode);
		int pcnt = service.ProductCount(ccode);
		System.out.println("결과 : "+pcnt);
		model.addAttribute("List",List);
		model.addAttribute("pcnt",pcnt);
		return "/Product/Products";
	}
	
		
	

}
