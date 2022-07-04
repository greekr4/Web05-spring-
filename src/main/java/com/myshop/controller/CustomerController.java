package com.myshop.controller;

import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.CustomerDTO;
import com.myshop.service.CustomerService;

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
		return "/Customer/JoinForm";
	}
	
	//마이페이지
	@RequestMapping(value = "/Mypage",method = RequestMethod.GET)
	public String Mypage(Model model) throws Exception{
		String sid = (String)session.getAttribute("sid");
		CustomerDTO DTO = new CustomerDTO();
		DTO.setEmail(sid);
		DTO = service.CustomerInfo(DTO);
		model.addAttribute("DTO",DTO);
		
		
		return "/Customer/Mypage";
	}
	
	//마이페이지
	@RequestMapping("/JoinOK")
	public String JoinOK(){
		return "/Customer/JoinOK";
	}
	
	//로그인
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String LoginForm(Locale locale, Model model,CustomerDTO DTO) throws Exception {
		CustomerDTO loginDTO = service.CustomerInfo(DTO);
		
		if(loginDTO != null) {
			if(pwdEncoder.matches(DTO.getPw(), loginDTO.getPw()) == true) {
				session.setAttribute("sdto", loginDTO);
				session.setAttribute("sid", loginDTO.getEmail());
				service.CustomerLoginCnt(loginDTO);
				service.CustomerLoginDate(loginDTO);
				return "redirect:../";
			}else {
				//비번틀림
				System.out.println("비밀번호X");
			}
		}else {
			//아이디 없음
			System.out.println("아이디X");
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
			if(service.CustomerJoin(DTO) > 0) {
				//가입성공
				return "redirect:../Customer/JoinOK";
			}else {
				//가입실패 어차피 500뜨긴함
				return "/Customer/JoinForm";
			}
		}else {
			return "/Customer/JoinForm";
		}
	}
	
	//아이디체크
	@RequestMapping(value = "IDCK", method = RequestMethod.GET)
	public void IDCK(@RequestParam String email, HttpServletResponse response) throws Exception{
		CustomerDTO DTO = new CustomerDTO();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();
		
		DTO.setEmail(email);
		if(service.CustomerInfo(DTO) == null) {
			out.println("<script>"
					+ "opener.document.getElementById('idno').style.display = 'none';"
					+ "opener.document.getElementById('idok').style.display = 'block';"
					+ "</script>");	
		}else {
			out.println("<script>"
					+ "opener.document.getElementById('idok').style.display = 'none';"
					+ "opener.document.getElementById('idno').style.display = 'block';"
					+ "</script>");	
		}
		
		
	}

}
