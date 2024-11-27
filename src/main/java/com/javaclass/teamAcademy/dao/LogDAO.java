package com.javaclass.teamAcademy.dao;

import com.javaclass.teamAcademy.domain.LogVO;

public interface LogDAO {

	/*
	 * id 중복체트 기능 구현
	 */	
	LogVO  idCheck(LogVO vo);
	
	/*
	 * 회원가입기능 구현
	 */
	int userInsert(LogVO vo);
	
	/*
	 * 로그인 확인 기능 구현
	 */
	LogVO userLogin(LogVO vo);
	
}

