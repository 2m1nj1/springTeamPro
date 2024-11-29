package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.ListDAO;
import com.javaclass.teamAcademy.vo.UserVO;

@Service
public class ListServiceImpl implements ListService {

	@Autowired
	private ListDAO listDao;

	@Override
	public List<UserVO> selectStuList() {
		
		return listDao.selectStuList();
	} // end of selectStuList()
	
} // end of ListService
