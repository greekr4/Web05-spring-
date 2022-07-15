package com.myshop.dao;

import java.util.List;

import com.myshop.dto.CommentDTO;
import com.myshop.dto.ReCommentDTO;

public interface CommentDAO {
	//댓글 리스트
	public List<CommentDTO> CommentList(int board_seq) throws Exception;
	//댓글 작성
	public void CommentAdd(CommentDTO DTO) throws Exception;
	//댓글 수정
	public void CommentEdit(CommentDTO DTO) throws Exception;
	//댓글 삭제
	public void CommentDel(int seq) throws Exception;
	//댓글 추천
	public void Comment_REC_UP(int seq) throws Exception;
	//본글 삭제시
	public void CommentDel_All(int board_seq) throws Exception;
	
	
	//////////////////////////////대댓글
	
	//대댓글 리스트
	public List<ReCommentDTO> Re_CommentList(int comment_seq) throws Exception;
	//대댓글 작성
	public void Re_CommentAdd(ReCommentDTO DTO) throws Exception;
	//대댓글 삭제
	public void Re_CommentDel(int seq) throws Exception;
	//대댓글 추천
	public void Re_Comment_REC_UP(int seq) throws Exception;
	//본댓글 삭제시
	public void RE_CommentDel_All(int comment_seq) throws Exception;
	
}
