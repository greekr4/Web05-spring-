package com.myshop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.json.JsonObject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshop.dto.BoardDTO;
import com.myshop.dto.CommentDTO;
import com.myshop.dto.ReCommentDTO;
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
		List = BoardService.BoardList(type);
		model.addAttribute("List",List);
		model.addAttribute("type",type);
		return "Board/List";
	}
	
	@RequestMapping("/More")
	public String BoardMore(Model model,@RequestParam int seq,HttpServletResponse response,HttpServletRequest request) throws Exception{
		String value = Integer.toString(seq);
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals("PostBoard")) {
					oldCookie = cookie;
				}
			}
		}
		
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + value + "]")) {
	            BoardService.Board_CNT_UP(seq);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + value + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	        } 
		} else {
        	BoardService.Board_CNT_UP(seq);
            Cookie newCookie = new Cookie("PostBoard","[" + value + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(newCookie);
        }
		
		
		BoardDTO DTO = BoardService.BoardMore(seq);
		List<CommentDTO> CList = CommentService.CommentList(seq);
		List<List<ReCommentDTO>> RECList = new ArrayList<List<ReCommentDTO>>();
		for(int i=0;i<CList.size();i++) {
		List<ReCommentDTO> li = CommentService.Re_CommentList(CList.get(i).getSeq());
		if (!li.isEmpty()) {
		RECList.add(li);
		}
		}
		model.addAttribute("DTO",DTO);
		model.addAttribute("CList",CList);
		model.addAttribute("RECList",RECList);
		
		
//		String value = Integer.toString(DTO.getSeq());
//		if(!cnt.equals(value)) {
//			Cookie cookie = new Cookie("cnt",value);
//			cookie.setDomain("localhost");
//			cookie.setMaxAge(86400);
//			cookie.setSecure(true);
//			response.addCookie(cookie);
//			BoardService.Board_CNT_UP(seq);
//		}

		
		
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
	@RequestMapping("/AddForm_Review")
	public String AddForm_Review(@RequestParam int p_seq,Model model) throws Exception {
		model.addAttribute("p_seq",p_seq);
		return "Board/AddForm_Review";
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
	
	@RequestMapping("/REC_UP")
	public void REC_UP(@RequestParam int seq,HttpServletResponse response,HttpServletRequest request) throws Exception{
		
		String value = Integer.toString(seq);
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				System.out.println(cookie.getName()+"/쿠키/"+cookie.getValue());
				if(cookie.getName().equals("RECUP")) {
					oldCookie = cookie;
				}
			}
		}
		
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + value + "]")) {
				BoardService.Board_REC_UP(seq);
	            oldCookie.setValue(oldCookie.getValue() + "_[" + value + "]");
	            oldCookie.setPath("/");
	            oldCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(oldCookie);
	            ScriptUtils.alertAndClose(response, "글을 추천하셨습니다.");
	            return;
	        } 
		} else {
			BoardService.Board_REC_UP(seq);
            Cookie newCookie = new Cookie("RECUP","[" + value + "]");
            newCookie.setPath("/");
            newCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(newCookie);
            ScriptUtils.alertAndClose(response, "글을 추천하셨습니다.");
            return;
        }
		ScriptUtils.alertAndClose(response, "이미 추천하셨습니다.");
		

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

	
	
	///////////////////대댓글
	@RequestMapping("/ReCommentAdd")
	public void ReCommentAdd(ReCommentDTO DTO,HttpServletResponse response) throws Exception{
		CommentService.Re_CommentAdd(DTO);
		ScriptUtils.alertAndBackPage(response, "대댓글이 작성되었습니다.");
	}
	@RequestMapping("/ReCommentDel")
	public void ReCommentDel(@RequestParam int seq,HttpServletResponse response) throws Exception{
		CommentService.Re_CommentDel(seq);
		ScriptUtils.alertAndClose(response, "대댓글이 삭제되었습니다.");
	}
	
	@RequestMapping("/RECommentREC_UP")
	public void RECommentREC_UP(@RequestParam int seq,HttpServletResponse response) throws Exception{
		CommentService.Re_Comment_REC_UP(seq);
		ScriptUtils.alertAndClose(response, "대댓글을 추천하셨습니다.");
	}
	
	//////////////////////////리뷰
	
	@ResponseBody
	@RequestMapping("/Review_json")
	public JSONObject Review_json(@RequestParam int seq) throws Exception {
		BoardDTO DTO = BoardService.BoardMore(seq);
		JSONObject json = new JSONObject();
		json.put("DTO", DTO);
		return json;
	}
	
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("list_json") public JSONObject list_json(HttpServletResponse
	 * response) throws Exception{
	 *  List<CategoryDTO> List = service.CategoryList(
	 * //xml에서 카테고리 리스트 검색 HashMap<String, Object> map = new HashMap<String,
	 * Object>(); //맵 선언 map.put("CateList", List); //xml에서 받아온 카테고리 리스트를 map에 푸쉬
	 * JSONObject json = new JSONObject(); //제이슨 선언 json.putAll(map); //제이슨에 맵 푸쉬
	 * return json; //리턴 }
	 */
	

}
