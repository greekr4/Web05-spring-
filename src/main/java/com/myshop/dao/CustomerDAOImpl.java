package com.myshop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CustomerDTO;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
	private static final String namespace = "com.myshop.CustomerMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<CustomerDTO> CustomerList() throws Exception {
		return sqlSession.selectList(namespace+".CustomerList");
	}


	@Override
	public CustomerDTO CustomerInfo(CustomerDTO DTO) throws Exception {
		return sqlSession.selectOne(namespace+".CustomerInfo",DTO);
	}


	@Override
	public int CustomerJoin(CustomerDTO DTO) throws Exception {
		return sqlSession.insert(namespace+".CustomerJoin",DTO);
		
	}


	@Override
	public void CustomerLoginCnt(CustomerDTO DTO) throws Exception {
		sqlSession.update(namespace+".CustomerLoginCnt",DTO);
		
	}


	@Override
	public void CustomerLoginDate(CustomerDTO DTO) throws Exception {
		sqlSession.update(namespace+".CustomerLoginDate",DTO);
		
	}


	@Override
	public void CustomerEdit(CustomerDTO DTO) throws Exception {
		sqlSession.update(namespace+".CustomerEdit",DTO);
		
	}


	@Override
	public void CustomerDel(int seq) throws Exception {
		sqlSession.delete(namespace+".CustomerDel",seq);
		
	}


	@Override
	public List<CustomerDTO> CustomerList_Search_name(String name) throws Exception {
		return sqlSession.selectList(namespace+".CustomerList_Search_name",name);
	}


	@Override
	public List<CustomerDTO> CustomerList_Search_email(String email) throws Exception {
		return sqlSession.selectList(namespace+".CustomerList_Search_email",email);
	}


	@Override
	public List<CustomerDTO> CustomerList_Search_phonenum(String phonenum) throws Exception {
		return sqlSession.selectList(namespace+".CustomerList_Search_phonenum",phonenum);
	}

}
