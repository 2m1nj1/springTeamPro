package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.UserVO;

public interface SysStuDAO {
	
	public int selectStuAllCount();
	
	public List<UserVO> selectStuList();
	
	public UserVO selectStuDetail(UserVO vo);
	
	public void updateStuDetail(UserVO vo);
	
	public void deleteStu(UserVO vo);
	
	public void insertStu(UserVO vo);
	
} // end of ListDao
