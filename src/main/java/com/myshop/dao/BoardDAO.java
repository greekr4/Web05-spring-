package com.myshop.dao;

import java.util.List;

import com.myshop.dto.BoardDTO;

public interface BoardDAO {
	//보드리스트
	public List<BoardDTO> BoardList(int type) throws Exception;
	
}
