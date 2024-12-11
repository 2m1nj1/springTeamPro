package com.javaclass.teamAcademy.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.ExamVO;

@Repository
public class ExamDaoImpl implements ExamDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
	@Override
	public List<ExamVO> findAllExams() {
		return mybatis.selectList("ExamDao.selectAllExams");
	}// end of findAllExams
	
	
	@Override
	public List<ExamVO> fetchExamList(int userNo) {
		return mybatis.selectList("ExamDao.fetchExamList", userNo);
	}// end of fetchExamList

	
	@Override
	public List<Integer> fetchExamYears(int userNo) {
		return mybatis.selectList("ExamDao.fetchExamYears", userNo);
	}// end of fetchExamYears

	
	@Override
	public void insertExam(ExamVO evo) {
		System.out.println("Dao print evo: "+evo);
		mybatis.insert("ExamDao.insertExam", evo);
	}// end of insertExam

	
	@Override
	public List<ExamVO> fetchExamTitles(int year) {
		System.out.println("fetchExamTitles 호출! year : " + year);
		List<ExamVO> evolist = mybatis.selectList("ExamDao.fetchExamTitles", year);
		for( ExamVO evo : evolist ) {
			System.out.println("fetched Exam titles" + evo);
		}
		return evolist;
	}// end of fetchExamTitles
	
	
	@Override
	public String fetchExamContext(int examNo) {
		System.out.println("fetchExamContext 호출! examNo : " + examNo);
		String context = mybatis.selectOne("ExamDao.fetchExamContext", examNo);
		System.out.println("Converted context: " + context);
		return context;
	}// end of fetchExamContext

}