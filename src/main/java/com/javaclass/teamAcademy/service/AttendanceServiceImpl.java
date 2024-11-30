package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.AttendanceDao;
import com.javaclass.teamAcademy.vo.AttendanceVO;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	// 학생 출결 조회 페이지 기준으로 만듦
	
	@Autowired
	private AttendanceDao adao;
	
	// 출결 상세보기
	public AttendanceVO getAttendanceDetail(AttendanceVO vo){
		//System.out.println(vo.toString());
		return adao.getAttendanceDetail(vo);
	}
	// 출결 목록보기
	@Override
	public List<AttendanceVO> getAttendanceList(AttendanceVO vo) {
		//System.out.println(vo.toString());
		return adao.getAttendanceList(vo);
	}
	// [학생] nav bar 에 표시될 수강중인 강좌들 불러오기  
	@Override
	public List<String> getCoursesByStudent(int user_no) {
		//System.out.println("user_no= " + user_no);
		return adao.getCoursesByStudent(user_no);
	}
}
