package com.javaclass.teamAcademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.ProfileDAO;
import com.javaclass.teamAcademy.vo.ProfileVO;

@Service
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private ProfileDAO profileDAO;

	@Override
	public void createProfile(ProfileVO profilevo) {
		
		profileDAO.insertProfile(profilevo);
		
	}

	

}
