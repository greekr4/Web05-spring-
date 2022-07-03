package com.myshop.dto;

import java.util.Date;

import lombok.Data;


@Data
public class CustomerDTO {
	private int seq;			//식별번호
	private int state;			//회원상태
	private String state_val;	//상태+코드마스터
	private int grade;			//회원등급
	private String grade_val;	//등급+코드마스터
	private String email;		//이메일(아이디)
	private String pw;			//비밀번호
	private String name;		//이름
	private String phonenum;	//폰번
	private String addr1;		//주소
	private String addr2;		//상세주소
	private String zipcode;		//우편번호
	private int cnt;			//로그인카운트
	private Date regdate;		//가입일자
	private Date login_date;	//최종로그인
	private Date moddate;		//수정일자
	}


