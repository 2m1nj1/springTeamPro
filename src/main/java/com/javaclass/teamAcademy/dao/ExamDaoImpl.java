package com.javaclass.teamAcademy.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.ExamVO;

@Repository
public class ExamDaoImpl implements ExamDao{
	@Autowired
	private SqlSessionTemplate ss;
	
	public void insertExam(ExamVO vo){
		ss.insert("exan.insertExam", vo);
	}
}
