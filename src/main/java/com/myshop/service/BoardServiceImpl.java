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

	@Override
	public BoardDTO BoardMore(int seq) throws Exception {

		return dao.BoardMore(seq);
	}

	@Override
	public void BoardAdd(BoardDTO DTO) throws Exception {
		dao.BoardAdd(DTO);
		
	}

	@Override
	public void BoardEdit(BoardDTO DTO) throws Exception {
		dao.BoardEdit(DTO);
		
	}

	@Override
	public void BoardDel(int seq) throws Exception {
		dao.BoardDel(seq);
		
	}

	@Override
	public void BoardAdd_QNA(BoardDTO DTO) throws Exception {
		dao.BoardAdd_QNA(DTO);
		
	}

	@Override
	public void QNA_CTN_UP(int seq) throws Exception {
		dao.QNA_CTN_UP(seq);
		
	}



	

}
