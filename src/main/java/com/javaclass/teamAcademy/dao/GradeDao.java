package com.javaclass.teamAcademy.dao;

import java.util.List;
import java.util.Map;

import com.javaclass.teamAcademy.vo.ExamVO;
import com.javaclass.teamAcademy.vo.GradeVO;

public interface GradeDao {
	
	List<GradeVO> fetchGradeList(int userNo);

	List<GradeVO> fetchGradeListByYear(int userNo, int year);

	void insertGrade(GradeVO gradeVO);

}