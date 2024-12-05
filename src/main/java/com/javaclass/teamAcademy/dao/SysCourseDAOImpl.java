package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.CourseCateVO;

@Repository
public class SysCourseDAOImpl implements SysCourseDAO {

	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<CourseCateVO> selectCourseCateList() {
		return mybatis.selectList("SysCourseDAO.selectCourseCateList");
	} // end of selectCourseCateList()

	
	
	
} // end of SysCourseDAOImpl()
