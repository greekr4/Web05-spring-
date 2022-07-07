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


	
	

}
