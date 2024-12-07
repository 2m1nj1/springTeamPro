package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.LectureVO;

@Repository
public class SysCourseDAOImpl implements SysCourseDAO {

	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<CourseCateVO> selectCourseCateList() {
		return mybatis.selectList("SysCourseDAO.selectCourseCateList");
	} // end of selectCourseCateList()
	

	@Override
	public void insertCourse(CourseVO vo) {
		mybatis.insert("SysCourseDAO.insertCourse", vo);
	} // end of insertCourse()

	@Override
	public void insertLectureList(LectureVO vo) {
		mybatis.insert("SysCourseDAO.insertLectureList", vo);
	} // end of insertLectureList()
	
	
} // end of SysCourseDAOImpl()
