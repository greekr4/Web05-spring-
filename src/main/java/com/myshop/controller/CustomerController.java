package com.myshop.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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

import com.myshop.dto.BasketDTO;
import com.myshop.dto.CustomerDTO;
import com.myshop.dto.OrderDTO;
import com.myshop.dto.ProductDTO;
import com.myshop.dto.RecentlyDTO;
import com.myshop.service.BasketService;
import com.myshop.service.CustomerService;
import com.myshop.service.OrderService;
import com.myshop.service.ProductService;
import com.myshop.service.RecentlyService;
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
	private CustomerService CustomerService;
	
	@Inject
	private RecentlyService RecentlyService;
	
	@Inject
	private BasketService BasketService;
	
	@Inject
	private ProductService ProductService;
	
	@Inject
	private OrderService OrderService;
	
	@Inject
	private HttpSession session;
	
	ScriptUtils ScriptUtils = new ScriptUtils();
	
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
	public String JoinForm(@ModelAttribute("CustomerDTO") CustomerDTO DTO,Model model,BindingResult result) throws Exception {
		return "/Customer/JoinForm";
	}
	

	//마이페이지
	@RequestMapping(value = "/Mypage",method = RequestMethod.GET)
	public String Mypage(Model model,HttpServletResponse response) throws Exception{
		if (session.getAttribute("sdto") == null) {
			ScriptUtils.alertAndMovePage(response, "로그인 해주세요!", "../Customer/LoginForm");
		}
		String sid = (String)session.getAttribute("sid");
		CustomerDTO sdto = (CustomerDTO) session.getAttribute("sdto");
		CustomerDTO DTO = new CustomerDTO();
		System.out.println("결과 : " + sdto.getSeq());
		List<RecentlyDTO> RecenList = RecentlyService.RecentlyList(sdto.getSeq());
		DTO.setEmail(sid);
		DTO = CustomerService.CustomerInfo(DTO);
		model.addAttribute("DTO",DTO);
		model.addAttribute("RecenList",RecenList);
		
		return "/Customer/Mypage";
	}
	
	//장바구니로
	@RequestMapping("/Mybasket")
	public String Mybasket(Model model,HttpServletResponse response) throws Exception {
		if (session.getAttribute("sdto") == null) {
			ScriptUtils.alertAndMovePage(response, "로그인 해주세요!", "../Customer/LoginForm");
		}
		CustomerDTO sdto = (CustomerDTO) session.getAttribute("sdto");
		int cus_seq = sdto.getSeq();
		
		List<BasketDTO> List = BasketService.BasketList(cus_seq);
		
		model.addAttribute("List",List);
		return "/Customer/Mybasket";
	}
	
	
	//주문 Form으로
	@RequestMapping("/OrderForm")
	public String OrderForm(Model model,@RequestParam int[] obj) throws Exception{
		List<ProductDTO> List = new ArrayList<>();
		
		for(int i=0;i<obj.length;i=i+2) {
			ProductDTO DTO = ProductService.ProductMore(obj[i]);
			DTO.setQty(obj[i+1]);
			List.add(DTO);
		}
			model.addAttribute("List",List);
			return "/Customer/OrderForm";
	}
	
	//주문 Add
	@RequestMapping("/OrderAdd")
	public void OrderAdd(OrderDTO DTO,HttpServletResponse response,@RequestParam String[] pcode,@RequestParam int[] qty2) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		int order_no = OrderService.LastOrderNo()+1;
		DTO.setOrder_no(order_no);
		map.put("cus_seq", DTO.getCus_seq());
		for(int i=0;i<pcode.length;i++) {
		DTO.setPcode(pcode[i]);
		DTO.setQty(qty2[i]);
		map.put("pcode",pcode[i]);
		OrderService.OrderLineAdd(DTO);
		BasketService.BasketDel(map);
		}
		OrderService.OrderAdd(DTO);
		ScriptUtils.alert(response, "");
	}
	
	//가입완료
	@RequestMapping("/JoinOK")
	public String JoinOK(){
		return "/Customer/JoinOK";
	}
	
	//로그인
	@RequestMapping(value = "/Login", method = RequestMethod.POST)
	public String LoginForm(Locale locale, Model model,CustomerDTO DTO) throws Exception {
		CustomerDTO loginDTO = CustomerService.CustomerInfo(DTO);
		
		if(loginDTO != null) {
			if(pwdEncoder.matches(DTO.getPw(), loginDTO.getPw()) == true) {
				session.setAttribute("sdto", loginDTO);
				session.setAttribute("scus_seq", loginDTO.getSeq());
				session.setAttribute("sid", loginDTO.getEmail());
				CustomerService.CustomerLoginCnt(loginDTO);
				CustomerService.CustomerLoginDate(loginDTO);
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
		if(DTO.getGrade() == 0) {
		DTO.setGrade(1);	
		}
	
		if(DTO.getEmail() != null) {
			
			DTO.setPw(pwdEncoder.encode(DTO.getPw()));
			if(CustomerService.CustomerJoin(DTO) > 0) {
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
		if(CustomerService.CustomerInfo(DTO) == null) {
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
	
	//정보수정
	@RequestMapping("Edit")
	public void Edit(@RequestParam int seq, @RequestParam int grade, @RequestParam String pw,@RequestParam String name,@RequestParam String phonenum,@RequestParam String addr1,@RequestParam String addr2,@RequestParam String zipcode,HttpServletResponse response) throws Exception{
		CustomerDTO DTO = new CustomerDTO();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		
		DTO.setPw(pw);		DTO.setName(name);		DTO.setPhonenum(phonenum);
		DTO.setAddr1(addr1);		DTO.setAddr2(addr2);		DTO.setZipcode(zipcode);
		DTO.setGrade(grade);		DTO.setSeq(seq);
		CustomerService.CustomerEdit(DTO);
		PrintWriter out = response.getWriter();
		out.println("<script>"
				+ "alert('수정되었습니다.');"
				+ "opener.location.reload();"
				+ "</script>");
	}
	
	//삭제
	@RequestMapping("Del")
	public void Del(@RequestParam int seq,HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;utf-8");
		PrintWriter out = response.getWriter();
		CustomerService.CustomerDel(seq);
		out.println("<script>"
				+ "alert('삭제되었습니다.');"
				+ "opener.location.reload();"
				+ "</script>");
		
	}
	

}
