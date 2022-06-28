package com.myshop.myapp;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.test.context.ContextConfiguration;


@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class JDBCTest2 {
	@Inject
	SqlSession sqlsession;
	
	
	@Test
	public void testConnection() {
		System.out.println(sqlsession.selectList("com.myshop.mySqlTestMapper.testlist"));
	
	}
}