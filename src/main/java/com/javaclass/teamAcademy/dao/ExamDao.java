package com.javaclass.teamAcademy.dao;

import java.util.List;
import java.util.Map;

import com.javaclass.teamAcademy.vo.ExamVO;

public interface ExamDao {
	
	List<ExamVO> findAllExams();
	
	List<ExamVO> fetchExamList(int userNo);

	List<Integer> fetchExamYears(int userNo);

	public List<ExamVO> fetchExamTitles(int year);
	
	public String fetchExamContext(int examNo);
	
	void insertExam(ExamVO evo);
	
}