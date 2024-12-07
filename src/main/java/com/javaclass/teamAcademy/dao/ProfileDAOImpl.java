package com.javaclass.teamAcademy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.ProfileVO;

@Repository
public class ProfileDAOImpl implements ProfileDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertProfile(ProfileVO profilevo) {
		
		mybatis.insert("ProfileMapper.createProfile", profilevo);
		
	}

}
