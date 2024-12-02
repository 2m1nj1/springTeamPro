package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.ClassroomVO;

public interface SystemDAO {
	
	public List<ClassroomVO> SelectClassroomList(ClassroomVO vo);
	
} // end of SystemDAO
