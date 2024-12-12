package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.TchAttendanceDAO;
import com.javaclass.teamAcademy.vo.TchAttendanceVO;

@Service
public class TchAttendanceServiceImpl implements TchAttendanceService {

		@Autowired
		private TchAttendanceDAO tchAttendanceDAO;
		
		//강좌별 학생 목록 
		public List<TchAttendanceVO>tchAttendance() {
			return tchAttendanceDAO.tchAttendance();
		}
	

	
}
