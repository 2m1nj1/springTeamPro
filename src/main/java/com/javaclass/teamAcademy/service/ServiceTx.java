package com.javaclass.teamAcademy.service;

import java.util.List;
import java.util.Map;

import com.javaclass.teamAcademy.vo.ExamVO;
import com.javaclass.teamAcademy.vo.GradeVO;

public interface ServiceTx {
	// 서로 다른 두 테이블에 한번에 값을 넣어야 함으로 인해 transaction 실행.
	
	List<ExamVO> getAllExams();

	List<ExamVO> fetchExamList(int userNo);
	
	List<Integer> fetchExamYears(int userNo);

	List<GradeVO> fetchGradeList(int userNo);

	List<GradeVO> fetchGradeListByYear(int userNo, int year);

	void insertGradesAndExams(Map<String, Object> data) throws Exception;

}