package com.javaclass.teamAcademy.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.LogVO;

@Repository
public class LogDAOImpl implements LogDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertUser(LogVO logvo) {
		System.out.println("===> academyMapper userInsert 호출");
		mybatis.insert("academyMapper.userInsert", logvo);
		System.out.println(">> 잘나옴!!  " + logvo.getUser_No());
	}

	@Override
	public LogVO studentLogin(LogVO vo) {
		System.out.println("===> academyMapper loginCheck 호출");
		return mybatis.selectOne("academyMapper.loginCheck", vo);
	}

	@Override
	public LogVO loginCheck(LogVO vo) {
		System.out.println("===> academyMapper loginCheck 호출");
		return mybatis.selectOne("academyMapper.loginCheck", vo);
	}

	@Override
	public int findIdCheck(String user_Name, String user_Email) {
		System.out.println("===> academyMapper findIdCheck 호출");
		LogVO vo = new LogVO();
        vo.setUser_Name(user_Name);
        vo.setUser_Email(user_Email);
		
        LogVO result = mybatis.selectOne("academyMapper.findIdCheck", vo);
        return result != null ? 1 : 0;
	}

	@Override
	public String findUserId(String user_Name, String user_Email) {
		
		System.out.println("===> academyMapper findUserId 호출");
        LogVO vo = new LogVO();
        vo.setUser_Name(user_Name);
        vo.setUser_Email(user_Email);
        
        LogVO result = mybatis.selectOne("academyMapper.findUserId", vo);
        return result != null ? result.getUser_Id() : null;
    }

	@Override
	public LogVO getLog(Integer user_No) {
		System.out.println("Mybatis getLog() 호출 - 1>" + user_No);
		LogVO result = mybatis.selectOne("academyMapper.getLog", user_No);
		System.out.println("Mybatis getLog() 호출 - 2>" + result.toString());
		return result;
	}


}
