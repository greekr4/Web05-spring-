package com.myshop.service;

import java.util.List;
import java.util.Map;

import com.myshop.dto.BoardDTO;
import com.myshop.util.PagingVO;

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
	//댓글 업데이트
	public void Replay_Update(int seq) throws Exception;
	//추천
	public void Board_REC_UP(int seq) throws Exception;
	//조회
	public void Board_CNT_UP(int seq) throws Exception;
	
	////////////리뷰
	//리뷰 리스트
	public List<BoardDTO> ReviewList(int p_seq) throws Exception;
	//리뷰 쓰기
	public void ReviewAdd(BoardDTO DTO) throws Exception;
	
	
	//////////페이징
	//게시글 수
	public int Boardcnt(int type) throws Exception;
	//페이징 처리 후 게시글 조회
	public List<BoardDTO> selectBoard(PagingVO vo) throws Exception;
}
