package com.myshop.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.CategoryDTO;
import com.myshop.dto.CustomerDTO;
import com.myshop.service.CategoryService;
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
	private CategoryService CategoryService;
	
	@Inject
	private HttpSession session;
	
	
	// JSP 연결
	
	//오더리스트
	@RequestMapping("OrderList")
	public String OrderList(){
		return "/Admin/OrderList";
	}
	
	//회원리스트
	@RequestMapping(value = "CusList", method = RequestMethod.GET)
	public String CusList(Locale locale,Model model) throws Exception{
		List<CustomerDTO> List = CustomerService.CustomerList();

		model.addAttribute("List",List);
		return "/Admin/CusList";
	}
	
	//휴먼회원리스트 
	//지금은 c:if로 나눴는데 추후에 DB에서 나눠야함
	@RequestMapping(value = "CusDorList", method = RequestMethod.GET)
	public String CusDorList(Locale locale,Model model) throws Exception{
		List<CustomerDTO> List = CustomerService.CustomerList();

		model.addAttribute("List",List);
		return "/Admin/CusDorList";
	}
	
	//회원리스트_검색
	@RequestMapping("CusList_Search")
	public String CusList_Search(Locale locale,Model model,@RequestParam int search_type,@RequestParam String search_val) throws Exception{
		List<CustomerDTO> List = new ArrayList<CustomerDTO>();
		
		switch (search_type) {
		case 1:
			String name = "%"+search_val+"%";
			List = CustomerService.CustomerList_Search_name(name);
			break;
		case 2:
			String email = "%"+search_val+"%";
			List = CustomerService.CustomerList_Search_email(email);
			break;
		case 3:
			String phonenum = "%"+search_val+"%";
			List = CustomerService.CustomerList_Search_phonenum(phonenum);
			break;
		}
		 
		
		model.addAttribute("List",List);
		return "/Admin/CusList";
	}
	
	//카테고리관리
	@RequestMapping(value = "Category", method = RequestMethod.GET)
	public String Category(Locale locale,Model model) throws Exception{
		List<CategoryDTO> List = CategoryService.CategoryList();
		model.addAttribute("List",List);
		return "/Admin/Category";
	}
	
	//제품관리
	@RequestMapping(value = "ProductList", method = RequestMethod.GET)
	public String ProductList(Locale locale,Model model) throws Exception{
		return "/Admin/ProductList";
	}
	
	//공지사항
	@RequestMapping(value = "NoticeList", method = RequestMethod.GET)
	public String NoticeList(Locale locale,Model model) throws Exception{
		return "/Admin/NoticeList";
	}
	
	//FAQList
	@RequestMapping(value = "FAQList", method = RequestMethod.GET)
	public String FAQList(Locale locale,Model model) throws Exception{
		return "/Admin/FAQList";
	}
	
	//제품관리
	@RequestMapping(value = "QNAList", method = RequestMethod.GET)
	public String QNAList(Locale locale,Model model) throws Exception{
		return "/Admin/QNAList";
	}
	
	//제품관리
	@RequestMapping(value = "ReviewList", method = RequestMethod.GET)
	public String ReviewList(Locale locale,Model model) throws Exception{
		return "/Admin/ReviewList";
	}
	
	

}
