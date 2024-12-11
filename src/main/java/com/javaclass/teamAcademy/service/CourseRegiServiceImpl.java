package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.CourseRegiDAO;
import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.UserVO;

@Service
public class CourseRegiServiceImpl implements CourseRegiService {

	@Autowired
	private CourseRegiDAO courseRegiDao;
	
	@Override
	public List<CourseCateVO> selectCourseCateGrade() {
		return courseRegiDao.selectCourseCateGrade();
	} // end of selectCourseCateGrade()

	@Override
	public List<CourseCateVO> selectCourseCateDownList(String upon) {
		return courseRegiDao.selectCourseCateDownList(upon);
	} // end of selectAreaList()

	@Override
	public List<UserVO> selectConTchList(String cate_no) {
		return courseRegiDao.selectConTchList(cate_no);
	} // end of selectConTchList()

	@Override
	public List<CourseVO> selectConCourseList(String selected, List<String> checked) {
		return courseRegiDao.selectConCourseList(selected, checked);
	}

	@Override
	public List<String> selectConCourseSch(int course_no) {
		return courseRegiDao.selectConCourseSch(course_no);
	} // end of selectConCourseSch()

	
	
} // end of CourseServiceImpl
