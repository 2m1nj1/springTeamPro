package com.javaclass.teamAcademy.dao;

import com.javaclass.teamAcademy.vo.LogVO;
import com.javaclass.teamAcademy.vo.ProfileVO;

public interface ProfileDAO {

	void insertProfile(ProfileVO profilevo);

	void updateProfile(LogVO logvo)throws Exception;
	
	LogVO getUserProfile(Integer user_No);

	
	
	
}
