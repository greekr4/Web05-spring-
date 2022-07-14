package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myshop.dao.CommentDAO;
import com.myshop.dto.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {
	@Inject
	private CommentDAO dao;

	@Override
	public List<CommentDTO> CommentList(int board_seq) throws Exception {
		return dao.CommentList(board_seq);
	}

	@Override
	public void CommentAdd(CommentDTO DTO) throws Exception {
		dao.CommentAdd(DTO);
		
	}

	@Override
	public void CommentEdit(CommentDTO DTO) throws Exception {
		dao.CommentEdit(DTO);
		
		
	}

	@Override
	public void CommentDel(int seq) throws Exception {
		dao.CommentDel(seq);
		
	}

	@Override
	public void Comment_REC_UP(int seq) throws Exception {
		dao.Comment_REC_UP(seq);
		
	}

	@Override
	public void CommentDel_All(int board_seq) throws Exception {
		dao.CommentDel_All(board_seq);
		
	}



}
