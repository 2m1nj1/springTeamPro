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

	@Override
	public List<ExamVO> fetchExamList(int userNo) {
		return examDao.fetchExamList(userNo);
	}

	@Override
	public List<Integer> fetchExamYears(int userNo) {
		return examDao.fetchExamYears(userNo);
	}
	
	@Override
	public List<GradeVO> fetchGradeList(int userNo) {
		return gradeDao.fetchGradeList(userNo);
	}

	
	@Override
	public List<GradeVO> fetchGradeListByYear(int userNo, int year) {
		return gradeDao.fetchGradeListByYear(userNo, year);
	}

	@Transactional
	@Override
	public void insertGradesAndExams(Map<String, Object> data) throws Exception { //화살표 생김; AOP! root-context 확인해봐요
		// grade / exam 나뉘지 않고, Transaction 안 주고.
		// ALL or NOTHING 트랜젝션 단위로 잡아줌.
		gradeDao.insertGradesAndExams(data);
		System.out.println("Grade + Exam OK : " + data);
		
	}
	 
}