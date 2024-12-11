package com.javaclass.teamAcademy.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.UserVO;

@Repository
public class CourseRegiDAOImpl implements CourseRegiDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<CourseCateVO> selectCourseCateGrade() {
		return mybatis.selectList("CourseRegiDAO.selectCourseCateGrade");
	} // end of selectCourseCateGrade()

	@Override
	public List<CourseCateVO> selectCourseCateDownList(String upon) {
		return mybatis.selectList("CourseRegiDAO.selectCourseCateDownList", upon);
	} // end of selectAreaList()

	@Override
	public List<UserVO> selectConTchList(String cate_no) {
		return mybatis.selectList("CourseRegiDAO.selectConTchList", cate_no);
	} // end of selectConTchList()

	@Override
	public List<CourseVO> selectConCourseList(String selected, List<String> checked) {
		Map<String, Object> params = new HashMap<>();
		params.put("selected", selected);
		params.put("checked", checked);
		
		List<CourseVO> result = mybatis.selectList("CourseRegiDAO.selectConCourseList", params);	
//		for(CourseVO vo : result) {
//			System.out.println(">> CourseInfo repo 도착! : " + vo.toString());
//		}
		
		return result;
	} // end of selectConCourseList()

	@Override
	public List<String> selectConCourseSch(int course_no) {
		
		List<CourseVO> courseVO = mybatis.selectList("CourseRegiDAO.selectConCourseSch", course_no);
		
		List<String> resultList = new ArrayList<>();
		for(CourseVO vo : courseVO) {
			//System.out.println(">> repo 도착! : " + course_no + " / " + vo.getCourse_sch());
			resultList.add(vo.getCourse_sch());
		}
		
		return resultList;
	} // end of selectConCourseSch()
	
} // end of CourseRegiDAOImpl
