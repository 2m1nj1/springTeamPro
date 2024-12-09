package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.SysCourseDAO;
import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseSchVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.LectureVO;

@Service
public class SysCourseServiceImpl implements SysCourseService {

	@Autowired
	SysCourseDAO sysCourseDao;
	
	@Override
	public List<CourseCateVO> selectCourseCateList() {
		return sysCourseDao.selectCourseCateList();
	} // end of selectCourseCateList()

	@Override
	public void insertCourse(CourseVO vo) {
		sysCourseDao.insertCourse(vo);
	} // end of insertCourse()

	@Override
	public void insertLectureList(LectureVO vo) {
		sysCourseDao.insertLectureList(vo);
	} // end of insertLectureList()

	@Override
	public void insertSchList(CourseSchVO vo) {
		sysCourseDao.insertSchList(vo);
	} // end of insertSchList()

	@Override
	public List<CourseVO> selectCourseList() {
		return sysCourseDao.selectCourseList();
	} // end of selectCourseList()

	@Override
	public CourseVO selectCourseInfo(CourseVO vo) {
		return sysCourseDao.selectCourseInfo(vo);
	}

	@Override
	public List<CourseSchVO> selectCourseSch(CourseVO vo) {
		return sysCourseDao.selectCourseSch(vo);
	}

	@Override
	public List<LectureVO> selectCourseLec(CourseVO vo) {
		return sysCourseDao.selectCourseLec(vo);
	}
	
	
} // end of SysCourseServiceImpl
