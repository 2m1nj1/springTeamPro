package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.ClassroomVO;

public interface SystemService {

	public List<ClassroomVO> SelectClassroomList(ClassroomVO vo);
	
} // end of SystemService
