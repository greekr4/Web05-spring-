package com.myshop.service;

import java.util.List;

import com.myshop.dto.BoardDTO;

public interface BoardService {
	//보드리스트
	public List<BoardDTO> BoardList(int type) throws Exception;
	
}
