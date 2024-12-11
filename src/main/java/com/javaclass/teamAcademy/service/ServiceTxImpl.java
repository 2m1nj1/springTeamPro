package com.javaclass.teamAcademy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaclass.teamAcademy.dao.ExamDao;
import com.javaclass.teamAcademy.dao.GradeDao;
import com.javaclass.teamAcademy.vo.ExamVO;
import com.javaclass.teamAcademy.vo.GradeVO;

@Service
public class ServiceTxImpl implements ServiceTx {

	@Autowired
	private ExamDao examDao;

	@Autowired
	private GradeDao gradeDao;
	
	// 모든 시험 정보 물어옴.
	@Override
	public List<ExamVO> getAllExams() {
		return examDao.findAllExams();
	}// end of getAllExams

	
	// 시험 리스트 물어옴
	@Override
	public List<ExamVO> fetchExamList(int userNo) {
		return examDao.fetchExamList(userNo);
	}// end of fetchExamList

	
	// 시험 연도 물어옴
	@Override
	public List<Integer> fetchExamYears(int userNo) {
		return examDao.fetchExamYears(userNo);
	}// end of fetchExamYears
	
	
	// 성적 리스트 물어옴
	@Override
	public List<GradeVO> fetchGradeList(int userNo) {
		return gradeDao.fetchGradeList(userNo);
	}// end of fetchGradeList

	
	// 연도에 따른 성적 정보 물어옴
	@Override
	public List<GradeVO> fetchGradeListByYear(int userNo, int year) {
		return gradeDao.fetchGradeListByYear(userNo, year);
	}// end of fetchGradeListByYear
	

	// 사용자가 기입한 grade 와 exam 정보 삽입
	@Transactional
	@Override
	public void insertGradesAndExams(Map<String, Object> data) throws Exception { //화살표 생김; AOP! root-context 확인해봐요
		// grade / exam 나뉘지 않고, Transaction 안 주고.
		// ALL or NOTHING 트랜젝션 단위로 잡아줌.
		gradeDao.insertGradesAndExams(data);
		System.out.println("Grade + Exam OK : " + data);	
	}// insertGradesAndExams
	 
}