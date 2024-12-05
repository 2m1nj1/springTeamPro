package com.javaclass.teamAcademy.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.ExamVO;

@Repository
public class ExamDaoImpl implements ExamDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<ExamVO> fetchExamList(int userNo) {
		return mybatis.selectList("ExamDao.fetchExamList", userNo);
	}

	@Override
	public List<Integer> fetchExamYears(int userNo) {
		return mybatis.selectList("ExamDao.fetchExamYears", userNo);
	}

	@Override
	public void insertExam(ExamVO evo) {
		System.out.println("Dao print evo: "+evo);
		mybatis.insert("ExamDao.insertExam", evo);
	}
	
}