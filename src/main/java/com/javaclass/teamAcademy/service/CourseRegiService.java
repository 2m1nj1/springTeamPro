package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.UserVO;

public interface CourseRegiService {

	public List<CourseCateVO> selectCourseCateGrade();
	
	public List<CourseCateVO> selectCourseCateDownList(String upon);
	
	public List<UserVO> selectConTchList(String cate_no);

	public List<CourseVO> selectConCourseList(String selected, List<String> checked);
	
	public List<String> selectConCourseSch(int course_no);
	
} // end of CourseService
