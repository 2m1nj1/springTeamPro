package com.javaclass.teamAcademy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.GradeVO;

@Repository
public class GradeDaoImpl implements GradeDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<GradeVO> fetchGradeList(int userNo) {
		return mybatis.selectList("GradeDao.fetchGradeList", userNo);
	}// end of fetchGradeList

	@Override
	public List<GradeVO> fetchGradeListByYear(int userNo, int year) {
		Map<String, Object> params = new HashMap<>();
	    params.put("userNo", userNo);
	    params.put("year", year);

	    return mybatis.selectList("GradeDao.fetchGradeListByYear", params);
	}// end of fetchGradeListByYear

	@Override
	public void insertGrade(GradeVO gradeVO) {
		System.out.println("Dao print insertGradesAndExams data: " + gradeVO);
		mybatis.insert("GradeDao.insertGrade", gradeVO);
	}// end of insertGrade
	
}