package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.UserVO;

public interface SysStuService {

	public List<UserVO> selectStuList();
	
	public UserVO selectStuDetail(UserVO vo);
	
	public void updateStuDetail(UserVO vo);
} // end of ListService
