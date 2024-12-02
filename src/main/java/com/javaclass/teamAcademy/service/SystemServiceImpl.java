package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.SystemDAO;
import com.javaclass.teamAcademy.vo.ClassroomVO;

@Service
public class SystemServiceImpl implements SystemService {

	@Autowired
	private SystemDAO systemDao;
	
	@Override
	public List<ClassroomVO> SelectClassroomList(ClassroomVO vo) {
		return systemDao.SelectClassroomList(vo);
	} // end of SelectClassroomList()

} // end of SystemServiceImpl
