package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.LectureVO;

public interface SysCourseDAO {

	public List<CourseCateVO> selectCourseCateList();
	
	public void insertCourse(CourseVO vo);
	
	public void insertLectureList(LectureVO vo);
} // end of SysCourseDAO
