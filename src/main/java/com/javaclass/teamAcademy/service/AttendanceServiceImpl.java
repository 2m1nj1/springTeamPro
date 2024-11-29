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
	public AttendanceVO getAttendance(AttendanceVO vo){
		//System.out.println(vo.toString());
		return adao.getAttendance(vo);
	}
	// 출결 목록보기
	@Override
	public List<AttendanceVO> getAttendanceList(AttendanceVO vo) {
		//System.out.println(vo.toString());
		return adao.getAttendanceList(vo);
	};
}
