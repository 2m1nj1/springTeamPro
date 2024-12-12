package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.UserVO;

public interface SysStuService {
	
	public int selectStuAllCount();
	
	public int selectStuRegiCount();
	
	public int selectStuSecCount();
	
	public List<UserVO> selectStuRegi();
	
	public List<UserVO> selectStuList();
	
	public List<UserVO> selectStuNotRegi();
	
	public List<UserVO> selectStuSec();
	
	public UserVO selectStuDetail(UserVO vo);
	
	public List<CourseVO> selectStuDetailCourse(UserVO vo);
	
	public List<CourseVO> stuDetailCourseCancel(String stuUserNo, String cancelCourse);
	
	public void updateStuDetail(UserVO vo);
	
	public void deleteStu(UserVO vo);
	
	public void insertStu(UserVO vo);
} // end of ListService
