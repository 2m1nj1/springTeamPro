package com.javaclass.teamAcademy.service;

import com.javaclass.teamAcademy.vo.LogVO;

public interface LogService {
	
	// 회원가입
	void userInsert(LogVO logvo);
	
	public LogVO userLogin(LogVO vo);

	public String findUserId(String user_Name, String user_Email)throws Exception;
	
	public int findIdCheck(String user_Name, String user_Email)throws Exception;

	LogVO getLog(Integer user_NO);	

}
