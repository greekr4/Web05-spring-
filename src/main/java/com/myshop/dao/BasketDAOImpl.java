package com.myshop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.BasketDTO;
import com.myshop.dto.RecentlyDTO;

@Repository
public class BasketDAOImpl implements BasketDAO {
	private static final String namespace = "com.myshop.BasketMapper";

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<BasketDTO> BasketList(int cus_seq) throws Exception {
		return sqlSession.selectList(namespace+".BasketList",cus_seq);
	}

	@Override
	public void BasketAdd(Map<String, Object> map) throws Exception {
		sqlSession.insert(namespace+".BasketAdd",map);
		
	}

	@Override
	public void BasketEdit(Map<String, Object> map) throws Exception {
		sqlSession.update(namespace+".BasketEdit",map);
		
	}

	@Override
	public int BasketCK(Map<String, Object> map) throws Exception {
		return sqlSession.selectOne(namespace+".BasketCK",map);
	}

	@Override
	public void BasketDel(Map<String, Object> map) throws Exception {
		sqlSession.delete(namespace+".BasketDel",map);
		
	}


	
	

}
