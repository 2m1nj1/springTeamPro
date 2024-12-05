package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.SysCourseDAO;
import com.javaclass.teamAcademy.vo.CourseCateVO;

@Service
public class SysCourseServiceImpl implements SysCourseService {

	@Autowired
	SysCourseDAO sysCourseDao;
	
	@Override
	public List<CourseCateVO> selectCourseCateList() {
		return sysCourseDao.selectCourseCateList();
	} // end of selectCourseCateList()

	
	
	
} // end of SysCourseServiceImpl
