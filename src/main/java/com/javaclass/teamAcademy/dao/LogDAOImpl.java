package com.javaclass.teamAcademy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.domain.LogVO;

@Repository
public class LogDAOImpl implements LogDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public LogVO idCheck(LogVO vo) {
		System.out.println("===> academyMapper idCheck 호출");
		return mybatis.selectOne("academyMapper.idCheck", vo);
	}

	@Override
	public int userInsert(LogVO vo) {
		System.out.println("===> academyMapper userInsert 호출");
		return mybatis.insert("academyMapper.userInsert", vo);
	}

	@Override
	public LogVO userLogin(LogVO vo) {
		System.out.println("===> academyMapper idCheck 호출");
		return mybatis.selectOne("academyMapper.idCheck", vo);
	}
	
	
	
}
