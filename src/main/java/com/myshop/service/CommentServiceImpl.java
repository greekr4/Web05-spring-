package com.myshop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myshop.dao.CommentDAO;
import com.myshop.dto.CommentDTO;
import com.myshop.dto.ReCommentDTO;

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

	@Transactional
	@Override
	public void CommentDel(int seq) throws Exception {
		dao.CommentDel(seq);
		dao.RE_CommentDel_All(seq);
		
	}

	@Override
	public void Comment_REC_UP(int seq) throws Exception {
		dao.Comment_REC_UP(seq);
		
	}

	@Override
	public void CommentDel_All(int board_seq) throws Exception {
		dao.CommentDel_All(board_seq);
		
	}

	@Override
	public List<ReCommentDTO> Re_CommentList(int comment_seq) throws Exception {
		return dao.Re_CommentList(comment_seq);
	}

	@Override
	public void Re_CommentAdd(ReCommentDTO DTO) throws Exception {
		dao.Re_CommentAdd(DTO);
	}

	@Override
	public void Re_CommentDel(int seq) throws Exception {
		dao.Re_CommentDel(seq);
		
	}

	@Override
	public void Re_Comment_REC_UP(int seq) throws Exception {
		dao.Re_Comment_REC_UP(seq);
		
	}

	@Override
	public void RE_CommentDel_All(int comment_seq) throws Exception {
		dao.RE_CommentDel_All(comment_seq);
		
	}



}
