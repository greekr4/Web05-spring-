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
import com.myshop.dto.CommentDTO;
import com.myshop.service.BoardService;
import com.myshop.service.CommentService;
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
	private CommentService CommentService; 
	
	@Inject
	private HttpSession session;
	
	
	ScriptUtils ScriptUtils = new ScriptUtils();
	
	// JSP 연결
	
	@RequestMapping("List")
	public String Board(Model model,@RequestParam int type) throws Exception {
		List<BoardDTO> List = BoardService.BoardList(type);
		for (int i=0;i<List.size();i++) {
			BoardService.Replay_Update(List.get(i).getSeq());
		}
		
		model.addAttribute("List",List);
		model.addAttribute("type",type);
		return "Board/List";
	}
	
	@RequestMapping("/More")
	public String BoardMore(Model model,@RequestParam int seq) throws Exception{
		BoardDTO DTO = BoardService.BoardMore(seq);
		List<CommentDTO> CList = CommentService.CommentList(seq);
		model.addAttribute("DTO",DTO);
		model.addAttribute("CList",CList);
		return "Board/More";
	}
	
	@RequestMapping("/AddForm")
	public String AddForm(@RequestParam int type,Model model) throws Exception {
		model.addAttribute("type",type);
		return "Board/AddForm";
	}
	@RequestMapping("/AddForm_QNA")
	public String AddForm_QNA(@RequestParam int qna_seq,Model model) throws Exception {
		model.addAttribute("qna_seq",qna_seq);
		return "Board/AddForm_QNA";
	}
	
	@RequestMapping("/EditForm")
	public String EditForm(@RequestParam int seq,Model model) throws Exception {
		BoardDTO DTO = BoardService.BoardMore(seq);
		model.addAttribute("DTO",DTO);
		return "Board/EditForm";
	}
	
	@RequestMapping("/Add")
	public void Add(BoardDTO DTO,HttpServletResponse response) throws Exception{
		BoardService.BoardAdd(DTO);
		String alertText = "작성되었습니다.";
		String nextPage = "./List?type="+DTO.getType();
		ScriptUtils.alertAndMovePage(response, alertText, nextPage);
	}
	
	@RequestMapping("/AddQNA")
	public void AddQNA(BoardDTO DTO,HttpServletResponse response) throws Exception{
		//int seq = DTO.getSeq();
		BoardService.BoardAdd_QNA(DTO);
		//BoardService.QNA_CTN_UP(seq);
		String alertText = "작성되었습니다.";
		String nextPage = "./List?type="+DTO.getType();
		ScriptUtils.alertAndMovePage(response, alertText, nextPage);
	}
	
	@RequestMapping("/Edit")
	public void Edit(BoardDTO DTO,HttpServletResponse response) throws Exception{
		BoardService.BoardEdit(DTO);
		String alertText = "수정되었습니다.";
		String nextPage = "./List?type="+DTO.getType();
		ScriptUtils.alertAndMovePage(response, alertText, nextPage);
	}
	
	@RequestMapping("/Del")
	public void Del(@RequestParam int seq,@RequestParam int type,HttpServletResponse response) throws Exception{
		BoardService.BoardDel(seq);
		//CommentService.CommentDel_All(seq);
		String alertText = "삭제되었습니다.";
		String nextPage = "./List?type="+type;
		ScriptUtils.alertAndMovePage(response, alertText, nextPage);
	}
	
	///////////////////////////댓글
	
	@RequestMapping("/CommentAdd")
	public void CommentAdd(CommentDTO DTO,HttpServletResponse response) throws Exception{
		CommentService.CommentAdd(DTO);
		ScriptUtils.alertAndBackPage(response, "댓글이 작성되었습니다.");
	}
	
	@RequestMapping("/CommentEdit")
	public void CommentEdit(CommentDTO DTO,HttpServletResponse response) throws Exception{
		CommentService.CommentEdit(DTO);
		ScriptUtils.alertAndBackPage(response, "댓글이 수정되었습니다.");
	}
	
	@RequestMapping("/CommentDel")
	public void CommentDel(@RequestParam int seq,HttpServletResponse response) throws Exception{
		CommentService.CommentDel(seq);
		ScriptUtils.alertAndClose(response, "댓글이 삭제되었습니다.");
	}
	
	@RequestMapping("/CommentREC_UP")
	public void CommentREC_UP(@RequestParam int seq,HttpServletResponse response) throws Exception{
		CommentService.Comment_REC_UP(seq);
		ScriptUtils.alertAndClose(response, "댓글을 추천하셨습니다.");
	}

	
	

		
	

}
