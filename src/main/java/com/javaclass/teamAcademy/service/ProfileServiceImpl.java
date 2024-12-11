package com.javaclass.teamAcademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.ProfileDAO;
import com.javaclass.teamAcademy.vo.LogVO;
import com.javaclass.teamAcademy.vo.ProfileVO;

@Service
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private ProfileDAO profileDAO;

	@Override
	public void createProfile(ProfileVO profilevo) {
		
		profileDAO.insertProfile(profilevo);
		
	}

	@Override
	public void updateProfile(LogVO logvo)throws Exception{
		
		profileDAO.updateProfile(logvo);
		
	}

	@Override
	public LogVO getUserProfile(Integer user_No) {
		
		return profileDAO.getUserProfile(user_No);
	}
}
