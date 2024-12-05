package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.ExamVO;

public interface ExamDao {
	
	List<ExamVO> fetchExamList(int userNo);

	List<Integer> fetchExamYears(int userNo);

	void insertExam(ExamVO evo);
	
}