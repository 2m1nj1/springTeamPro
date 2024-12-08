package com.javaclass.teamAcademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.HomeDAO;
import com.javaclass.teamAcademy.vo.UserVO;

@Service
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeDAO homeDao;
	
	@Override
	public UserVO selectUser(String userId) {
		return homeDao.selectUser(userId);
	} // end of selectUser

	
	
} // end of HomeServiceImpl
