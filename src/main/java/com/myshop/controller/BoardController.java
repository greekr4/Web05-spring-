package com.myshop.controller;

import java.util.List;

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
import com.myshop.service.BoardService;
import com.myshop.util.ScriptUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/Board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
		
	@Inject
	private BoardService BoardService;
	
	@Inject
	private HttpSession session;
	
	ScriptUtils ScriptUtils = new ScriptUtils();
	
	// JSP 연결
	
	@RequestMapping("")
	public String Board(Model model,@RequestParam int type) throws Exception {
		List<BoardDTO> List = BoardService.BoardList(type);
		model.addAttribute("List",List);
		model.addAttribute("type",type);
		return "Board/BoardList";
	}
	
	@RequestMapping("/More")
	public String BoardMore(Model model,@RequestParam int seq) throws Exception{
		BoardDTO DTO = BoardService.BoardMore(seq);
		model.addAttribute("DTO",DTO);
		return "Board/BoardMore";
	}
	
	@RequestMapping("/AddForm")
	public String AddForm() throws Exception {
		return "Board/BoardAddForm";
	}
	
	@RequestMapping("/Add")
	public void Add(BoardDTO DTO,HttpServletResponse response) throws Exception{
		BoardService.BoardAdd(DTO);
		String alertText = "작성되었습니다.";
		String nextPage = "./?type="+DTO.getType();
		ScriptUtils.alertAndMovePage(response, alertText, nextPage);
	}

	
	

		
	

}
