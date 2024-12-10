package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.ClassroomVO;
import com.javaclass.teamAcademy.vo.CourseStaVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.EmailDomainVO;

public interface SystemService {

	public List<EmailDomainVO> selectEmailDomainList();
	
	public List<CourseStaVO> selectCourseStaList();
	
	public List<ClassroomVO> selectClassroomList(ClassroomVO vo);
	
	public ClassroomVO selectClassroomDetail(ClassroomVO vo);
	
	public void updateClassroom(ClassroomVO vo);
	
	public void deleteClassroom(ClassroomVO vo);
	
	public void insertClassroom(ClassroomVO vo);
	
	public int countCourse(String courseStaName);
	
	
} // end of SystemService
