package com.myshop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dto.BoardDTO;
import com.myshop.dto.ProductDTO;
import com.myshop.service.BasketService;
import com.myshop.service.BoardService;
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
	private BasketService BasketService;
	
	@Inject BoardService BoardService;
	
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
		if (session.getAttribute("scus_seq") == null) {
			ScriptUtils.alertAndMovePage(response, "로그인 해주세요!", "../Customer/LoginForm");
		}
		int scus_seq = (Integer) session.getAttribute("scus_seq");
		String pcode = DTO.getPcode();
		service2.RecentlyAdd(scus_seq, pcode);
		
		List<BoardDTO> List = BoardService.ReviewList(seq);
		model.addAttribute("DTO",DTO);
		model.addAttribute("List",List);
		return "/Product/ProductMore";
	}
	
	
	//장바구니 추가
	@RequestMapping("/BasketAdd")
	public void BasketAdd(Model model,@RequestParam int cus_seq,@RequestParam String pcode,@RequestParam int qty,HttpServletResponse response) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cus_seq", cus_seq);
		map.put("pcode",pcode);
		map.put("qty",qty);
		int CK = BasketService.BasketCK(map);
		if (CK == 0) {
			BasketService.BasketAdd(map);	
		}else {
			BasketService.BasketEdit(map);
		}
		
		ScriptUtils.alertAndClose(response, "장바구니에 추가되었습니다.");
	}
	
	//장바구니 삭제
	@RequestMapping("/BasketDel")
	public void BasketDel(Model model,@RequestParam int cus_seq,@RequestParam String pcode,HttpServletResponse response) throws Exception{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cus_seq", cus_seq);
		map.put("pcode",pcode);
		BasketService.BasketDel(map);
		ScriptUtils.alertAndClose(response, "장바구니에서 삭제되었습니다.");
	}
	
	

	
	

		
	

}
