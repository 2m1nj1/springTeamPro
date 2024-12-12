package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.TchAttendanceVO;

@Repository
public class TchAttendanceDAOImpl implements TchAttendanceDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	
	public List<TchAttendanceVO> tchAttendance() {
	  System.out.println("======> Mybatis tchAttendance() 호출");
	  
	  List<TchAttendanceVO> result =
	  mybatis.selectList("TchAttendanceDAO.tchAttendance"); 
	  return result;
	  }
	 
	
	
	
}
