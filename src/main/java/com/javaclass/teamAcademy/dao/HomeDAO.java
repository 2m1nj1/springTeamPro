package com.javaclass.teamAcademy.dao;

import com.javaclass.teamAcademy.vo.UserVO;

public interface HomeDAO {

	public UserVO selectUser(String userId);
	
} // end of HomeDAO
