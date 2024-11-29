package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.UserVO;

@Repository
public class ListDAOImpl implements ListDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public List<UserVO> selectStuList() {
		List<UserVO> result =  mybatis.selectList("ListDAO.selectStuList");
		
		for(UserVO vo : result) {
			System.out.println(vo.toString());
		}
		
		return result;
	} // end of selectStuList()
	
} // end of ListDaoImpl
