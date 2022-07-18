package com.myshop.myapp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myshop.dto.CustomerDTO;

@Repository
public class MybatisTest2 {
	@Autowired
	SqlSession sqlSession; 
	
	@Test
	public void testMybatis() {
		try { 
			System.out.println("Mybatis 실행 성공");
			int cnt = sqlSession.selectOne("sample.sampleCount");
			System.out.println("데이터 바인딩 성공~!");
			System.out.println("회원수 : "+cnt);
			System.out.println("데이터 출력 성공~!");
		} catch(Exception e) {
			System.out.println("테스트 종료");
		}
	}
	
	@Test
	public void testMybatis2() {
		try {
			System.out.println("Mybatis 실행 성공2");
			List<CustomerDTO> memList = sqlSession.selectList("com.myshop.CustomerMapper.CustomerList");
			System.out.println("데이터 바인딩 성공~!");
			for(int i=0;i < memList.size();i++) {
				CustomerDTO member = new CustomerDTO();
				member = memList.get(i);
				System.out.println("회원명 : "+member.getName());
			}
			System.out.println("데이터 출력 성공~!");
		} catch(Exception e) {
			System.out.println("테스트 종료2");
		}
	}
	
	public int mybatisRunning() {
		System.out.println("Mybatis 실행 성공2");
		return sqlSession.selectOne("com.myshop.CustomerMapper.CustomerList");
	}
	
	public List<CustomerDTO> mybatisRunning2() {
		System.out.println("Mybatis 실행 성공");
		return sqlSession.selectList("com.myshop.CustomerMapper.CustomerList");
	}
}