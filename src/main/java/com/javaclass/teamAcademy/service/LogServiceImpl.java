package com.javaclass.teamAcademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.LogDAO;
import com.javaclass.teamAcademy.vo.LogVO;


@Service
public class LogServiceImpl implements LogService{
	
	@Autowired
	private LogDAO logDAO;
	
//	@Autowired
//	private ProfileDAO profileDAO;
	  
		@Override
		public void userInsert(LogVO logvo){
			
			// 회원가입
			logDAO.insertUser(logvo);
			
			System.out.println("새User_No:" + logvo.getUser_No());
	    }

		@Override
		public LogVO userLogin(LogVO vo) {
			
			return logDAO.loginCheck(vo);
		}
		
		@Override
		public String findUserId(String user_Name, String user_Email){ 
			
			return logDAO.findUserId(user_Name, user_Email)	;
		}

		@Override
		public int findIdCheck(String user_Name, String user_Email){
			
			return logDAO.findIdCheck(user_Name, user_Email);
		}

		public LogVO getLog(Integer user_No) {
			
			return logDAO.getLog(user_No);
		}
	
}
