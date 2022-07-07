package com.myshop.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.CustomerDTO;
import com.myshop.dto.ProductDTO;
import com.myshop.service.ProductService;
import com.myshop.service.RecentlyService;
import com.myshop.util.ScriptUtils;

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
	private RecentlyService service2;
	
	@Inject
	private HttpSession session;
	
	ScriptUtils ScriptUtils = new ScriptUtils();
	
	// JSP 연결
	
	//상품 리스트
	@RequestMapping("/Products")
	public String Products(Model model,@RequestParam String ccode) throws Exception{
		List<ProductDTO> List = service.ProductList_ccode(ccode);
		int pcnt = service.ProductCount(ccode);
		model.addAttribute("ccode",ccode);
		model.addAttribute("List",List);
		model.addAttribute("pcnt",pcnt);
		return "/Product/Products";
	}
	
	//상품 상세 ProductMore
	//상품 리스트
	@RequestMapping("/ProductMore")
	public String ProductMore(Model model,@RequestParam int seq,HttpServletResponse response) throws Exception{
		ProductDTO DTO = service.ProductMore(seq);
		if (session.getAttribute("sdto") == null) {
			ScriptUtils.alertAndMovePage(response, "로그인 해주세요!", "../Customer/LoginForm");
		}
		CustomerDTO DTO2 = (CustomerDTO) session.getAttribute("sdto");
		int cus_seq = DTO2.getSeq();
		String pcode = DTO.getPcode();
		service2.RecentlyAdd(cus_seq, pcode);
		model.addAttribute("DTO",DTO);
		return "/Product/ProductMore";
	}
	
		
	

}
