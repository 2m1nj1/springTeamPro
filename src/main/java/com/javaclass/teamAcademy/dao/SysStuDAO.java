package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.UserVO;

public interface SysStuDAO {

	public List<UserVO> selectStuList();
	
	public UserVO selectStuDetail(UserVO vo);
	
	public void updateStuDetail(UserVO vo);
} // end of ListDao
