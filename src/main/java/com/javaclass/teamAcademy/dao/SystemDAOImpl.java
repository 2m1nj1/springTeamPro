package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.ClassroomVO;

@Repository
public class SystemDAOImpl implements SystemDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<ClassroomVO> SelectClassroomList(ClassroomVO vo) {
		List<ClassroomVO> result = mybatis.selectList("SystemDAO.selectClassroomList", vo);
		
		for(ClassroomVO temp : result) {
			System.out.println(">> " + temp.toString() );
		} 
		
		return result;
	} // end of SelectClassroomList

} // end of SystemDAOImpl
