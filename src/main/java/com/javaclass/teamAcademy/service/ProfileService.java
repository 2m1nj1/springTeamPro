package com.javaclass.teamAcademy.service;

import com.javaclass.teamAcademy.vo.LogVO;
import com.javaclass.teamAcademy.vo.ProfileVO;

public interface ProfileService {

	void createProfile(ProfileVO profilevo);

	void updateProfile(LogVO logvo)throws Exception;

	LogVO getUserProfile(Integer user_No);
}
