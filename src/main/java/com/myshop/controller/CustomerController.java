package com.myshop.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myshop.dto.CustomerDTO;
import com.myshop.service.CustomerService;
import com.myshop.util.ScriptUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/Customer/*")
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	@Inject
	private CustomerService service;
	
	@Inject
	private HttpSession session;
	
	@Inject
	private HttpServletResponse response;
	
	
	// JSP 연결
	
	//로그인 폼
	@RequestMapping("/LoginForm")
	public String LoginForm(){
		return "/Customer/LoginForm";
	}
	
	//이용약관 폼
	@RequestMapping("/Agreement")
	public String Agreement(){
		return "/Customer/Agreement";
	}
	
	//회원가입 폼
	@RequestMapping("/JoinForm")
	public String JoinForm(@ModelAttribute("CustomerDTO") CustomerDTO DTO, Model model,BindingResult result) throws Exception {
//		CustomerValidator aa = new CustomerValidator();
//		aa.validate(DTO, result);
//		if(result.hasErrors()) {
//			System.out.println("에러에러에러에러");
//		}

		
		
		return "/Customer/JoinForm";
	}
	
	//로그인
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String LoginForm(Locale locale, Model model,CustomerDTO DTO) throws Exception {
		CustomerDTO loginDTO = service.CustomerLogin(DTO);
		
		if(loginDTO != null) {
			if(pwdEncoder.matches(DTO.getPw(), loginDTO.getPw()) == true) {
				session.setAttribute("sid", loginDTO.getEmail());
				return "redirect:../";
			}else {
				//비번틀림
			}
		}else {
			//아이디 없음
		}
		
		return "redirect:LoginForm";
	}
	
	//로그아웃
	@RequestMapping("Logout")
	public String logout(HttpServletResponse response,HttpServletRequest request,HttpSession session){
		session.invalidate();
		return "redirect:../";
		
	}
	
	//회원가입
	@RequestMapping("Join")
	public String Join(@ModelAttribute("CustomerDTO") CustomerDTO DTO, Model model,BindingResult result) throws Exception{
		System.out.println(DTO);
		if(DTO.getEmail() != null) {
			DTO.setPw(pwdEncoder.encode(DTO.getPw()));
			service.CustomerJoin(DTO);
		}else {
			return "/Customer/JoinForm";
		}

		
		return "redirect:../";
		
	}

}
