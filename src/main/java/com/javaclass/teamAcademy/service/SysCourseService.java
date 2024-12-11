package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseSchVO;
import com.javaclass.teamAcademy.vo.CourseSchVOList;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.LectureVO;

public interface SysCourseService {

	public List<CourseCateVO> selectCourseCateList();
	
	public void insertCourse(CourseVO vo);
	
	public void insertLectureList(LectureVO vo);

	public void insertSchList(CourseSchVO vo);
	
	public List<CourseVO> selectCourseList();

	public CourseVO selectCourseInfo(CourseVO vo);
	
	public List<CourseSchVO> selectCourseSch(CourseVO vo);
	
	public List<LectureVO> selectCourseLec(CourseVO vo);
} // end of SysCourseService
