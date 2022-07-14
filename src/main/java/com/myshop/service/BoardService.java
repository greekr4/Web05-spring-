package com.myshop.service;

import java.util.List;

import com.myshop.dto.BoardDTO;

public interface BoardService {
	//보드리스트
	public List<BoardDTO> BoardList(int type) throws Exception;
	//상세조회
	public BoardDTO BoardMore(int seq) throws Exception;
	//글 작성
	public void BoardAdd(BoardDTO DTO) throws Exception;
	//글 수정
	public void BoardEdit(BoardDTO DTO) throws Exception;
	//글 삭제
	public void BoardDel(int seq) throws Exception;
	//QNA 글작성
	public void BoardAdd_QNA(BoardDTO DTO) throws Exception;
	//QNA_CTN_UP
	public void QNA_CTN_UP(int seq) throws Exception;
}
