package com.myshop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.RecentlyDTO;
import com.myshop.dto.SettlementDTO;

@Repository
public class SettlementDAOImpl implements SettlementDAO {
	private static final String namespace = "com.myshop.SettlementMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<SettlementDTO> SettlementList() throws Exception {
		return sqlSession.selectList(namespace+".SettlementList");
	}

	@Override
	public void SettlementAdd(SettlementDTO DTO) throws Exception {
		sqlSession.insert(namespace+".SettlementAdd",DTO);
	}

	@Override
	public void SettlementDel(int seq) throws Exception {
		sqlSession.delete(namespace+".SettlementDel",seq);
		
	}



	
	

}
