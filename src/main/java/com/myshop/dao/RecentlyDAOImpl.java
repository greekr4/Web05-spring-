package com.myshop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

	@Override
	public void RecentlyAdd(int cus_seq, String pcode) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cus_seq", cus_seq);
		map.put("pcode",pcode);
		sqlSession.insert(namespace+".RecentlyAdd",map);
		
	}

	
	

}
