package com.javaclass.teamAcademy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.GradeVO;

@Repository
public class GradeDaoImpl implements GradeDao{
	@Autowired
	private SqlSessionTemplate ss;
	
	public void insertGrade(GradeVO vo){
		
		ss.insert("grade.insertGrade", vo);
	}
}
