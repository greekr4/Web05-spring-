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


	
	

}
