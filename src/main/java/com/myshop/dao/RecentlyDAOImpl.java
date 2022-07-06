package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CustomerDTO;
import com.myshop.dto.ProductDTO;
import com.myshop.dto.RecentlyDTO;

@Repository
public class RecentlyDAOImpl implements RecentlyDAO {
	private static final String namespace = "com.myshop.RecentlyMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<RecentlyDTO> RecentlyList(int cus_seq) throws Exception {
		return sqlSession.selectList(namespace+".RecentlyList",cus_seq);
	}

	
	

}
