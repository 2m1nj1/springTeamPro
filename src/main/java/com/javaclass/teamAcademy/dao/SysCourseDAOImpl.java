package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseSchVO;
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

	@Override
	public void insertSchList(CourseSchVO vo) {
		mybatis.insert("SysCourseDAO.insertSchList", vo);
	} // end of insertSchList()

	@Override
	public List<CourseVO> selectCourseList() {
		List<CourseVO> result = mybatis.selectList("SysCourseDAO.selectCourseList");
		return result;
	} // end of selectCourseList()

	@Override
	public CourseVO selectCourseInfo(CourseVO vo) {
//		CourseVO result = mybatis.selectOne("SysCourseDAO.selectCourseInfo", vo);
//		
//		System.out.println("-------------------------------");
//		System.out.println(result.toString());
//		System.out.println("-------------------------------");
		return mybatis.selectOne("SysCourseDAO.selectCourseInfo", vo);
	} // end of selectCourseInfo()

	@Override
	public List<CourseSchVO> selectCourseSch(CourseVO vo) {
		return mybatis.selectList("SysCourseDAO.selectCourseSch", vo);
	} // end of selectCourseSch()
	
	@Override
	public List<LectureVO> selectCourseLec(CourseVO vo) {
		return mybatis.selectList("SysCourseDAO.selectCourseLec", vo);
	} // end of selectCourseLec()
	
} // end of SysCourseDAOImpl()
