package com.myshop.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshop.dto.CategoryDTO;
import com.myshop.service.CategoryService;
import com.myshop.util.ScriptUtils;


@Controller
@RequestMapping("/Category/*")
public class CategoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(CategoryController.class);
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	
	@Inject
	private CategoryService service;
	
	@Inject
	private HttpSession session;
	
	ScriptUtils ScriptUtils = new ScriptUtils();
	
	@ResponseBody
	@RequestMapping("list_json")
	public JSONObject list_json(HttpServletResponse response) throws Exception{
		List<CategoryDTO> List = service.CategoryList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("CateList", List);
		JSONObject json = new JSONObject();
		json.putAll(map);
		return json;
	}
	
	@RequestMapping("Add")
	public void Add(CategoryDTO DTO,HttpServletResponse response) throws Exception{
	service.CategoryAdd(DTO);
	ScriptUtils.alertAndClose(response, "추가되었습니다.");
	}
	
	
	@RequestMapping("Edit")
	public void Edit(@RequestParam int orderby,@RequestParam String code,@RequestParam String name,@RequestParam int seq,HttpServletResponse response) throws Exception{
	CategoryDTO DTO = new CategoryDTO();
	DTO.setSeq(seq); DTO.setOrderby(orderby); DTO.setCode(code); DTO.setName(name);
	service.CategoryEdit(DTO);
	ScriptUtils.alertAndClose(response, "수정되었습니다.");
	}
	
	@RequestMapping("Del")
	public void Del(@RequestParam int seq,HttpServletResponse response) throws Exception{
	service.CategoryDel(seq);
	ScriptUtils.alertAndClose(response, "삭제되었습니다.");
	}	
	 
	

}
