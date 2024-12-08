package com.javaclass.teamAcademy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.UserVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public UserVO selectUser(String userId) {
		return mybatis.selectOne("HomeDAO.selectUser", userId);
	} // end of selectUser()

	
	
} // end of HomeDAOImpl
