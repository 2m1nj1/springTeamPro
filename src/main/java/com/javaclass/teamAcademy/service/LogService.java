package com.javaclass.teamAcademy.service;

import com.javaclass.teamAcademy.domain.LogVO;

public interface LogService {
	
	public LogVO idCheck_Login(LogVO vo);
	
	public int userInsert(LogVO vo);

}
