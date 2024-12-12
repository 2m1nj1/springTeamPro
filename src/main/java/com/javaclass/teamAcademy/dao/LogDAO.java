package com.javaclass.teamAcademy.dao;

import com.javaclass.teamAcademy.vo.LogVO;

public interface LogDAO {

	/*
	 * 회원가입기능 구현
	 */
	void insertUser(LogVO logvo);
	
	// 로그인
	LogVO studentLogin(LogVO vo);
	
	// 중복체크	
	LogVO loginCheck(LogVO vo);	
	
	// 이름과 이메일로 사용자 존재 여부 체크
	int findIdCheck(String user_Name, String user_Email);
	
	// 이름과 이메일로 사용자 아이디 찾기
	String findUserId(String user_Name, String user_Email);

	LogVO getLog(Integer user_No);

	void updateLog(LogVO logvo);

	int changePass(LogVO vo);

	LogVO getUserByEmail(String user_Email);

	int changePass(String user_Email, String user_Pass);
	
}

