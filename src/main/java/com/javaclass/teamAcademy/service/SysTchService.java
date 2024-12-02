package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.UserVO;

public interface SysTchService {
	
	public int selectTchAllCount();
	
	public List<UserVO> selectTchList(UserVO vo);
	
	public UserVO selectTchDetail(UserVO vo);
	
	public void updateTchDetail(UserVO vo);
	
	public void deleteTch(UserVO vo);
	
	public void insertTch(UserVO vo);
} // end of ListService
