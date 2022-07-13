package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.BoardDAO;
import com.myshop.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO dao;

	@Override
	public List<BoardDTO> BoardList(int type) throws Exception {
		return dao.BoardList(type);
	}



	

}
