package com.myshop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.BoardDTO;
import com.myshop.dto.RecentlyDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final String namespace = "com.myshop.BoardMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<BoardDTO> BoardList(int type) throws Exception {
		return sqlSession.selectList(namespace+".BoardList",type);
	}

	@Override
	public BoardDTO BoardMore(int seq) throws Exception {
		return sqlSession.selectOne(namespace+".BoardMore",seq);
	}

	@Override
	public void BoardAdd(BoardDTO DTO) throws Exception {
		sqlSession.insert(namespace+".BoardAdd",DTO);
	}

	@Override
	public void BoardEdit(BoardDTO DTO) throws Exception {
		sqlSession.update(namespace+".BoardEdit",DTO);
	}

	@Override
	public void BoardDel(int seq) throws Exception {
		sqlSession.delete(namespace+".BoardDel",seq);
	}

	@Override
	public void BoardAdd_QNA(BoardDTO DTO) throws Exception {
		sqlSession.insert(namespace+".BoardAdd_QNA",DTO);
		
	}

	@Override
	public void QNA_CTN_UP(int seq) throws Exception {
		sqlSession.update(namespace+".QNA_CTN_UP",seq);
		
	}

	@Override
	public void QNA_DEL_ALL(int qna_seq) throws Exception {
		sqlSession.delete(namespace+".QNA_DEL_ALL",qna_seq);
		
	}

	@Override
	public void Replay_Update(int seq) throws Exception {
		sqlSession.update(namespace+".Replay_Update",seq);
		
	}


	
	

}
