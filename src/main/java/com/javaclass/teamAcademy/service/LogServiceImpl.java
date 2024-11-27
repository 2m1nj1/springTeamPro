package com.javaclass.teamAcademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.LogDAOImpl;
import com.javaclass.teamAcademy.domain.LogVO;


@Service
public class LogServiceImpl {
	
	@Autowired
	private LogDAOImpl logDAO;
	
		/*
		 * 아이디 중복 체크하는 sql + 로그인 기능 sql
		 */
	  	public LogVO idCheck_Login(LogVO vo){
		  
	  		return logDAO.idCheck(vo);
	  	}
	  
	  
		/*
		 * 회원가입 sql
		 */
		 public int userInsert(LogVO vo ){
		
			return logDAO.userInsert(vo);
	    }

}
