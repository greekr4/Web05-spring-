package com.myshop.myapp;

import org.junit.Assert;
import org.junit.Test;

import com.myshop.dto.CustomerDTO;

public class DTOTest1 {
	
	@Test
	public void test() {
		System.out.println("DTO Test~!");
		CustomerDTO member = new CustomerDTO();
		member.setName("관리자");
		member.setEmail("admin");
		member.setPhonenum("010-1234-5678");
		DTOTest(member);
	}
	/*
	   	assertEquals([message], expected, actual) : 두 값이 같은 지 비교
		assertSame([message], expceted, actual), assertNotSame([message], expceted, actual) : 두 객체가 동일한 객체인지 비교
		assertTrue([message], expceted), assertFalse([message], expceted) : 참/거짓 판별
		assertNull([message], expceted), assertNotNull([message], expceted) : null여부 판단
		fail([message]) : 테스트 실패로 판단
	 */
	public void DTOTest(CustomerDTO mem) {
		try {
			Assert.assertNotNull(mem);	//값이 비어있는지 테스트
			Assert.assertEquals(mem.getName(), "관리자"); //특정 속성값의 일치 비교 테스트
		} catch(Exception e) {
			Assert.fail("해당 DTO가 비정상적임");
		}
	}
}