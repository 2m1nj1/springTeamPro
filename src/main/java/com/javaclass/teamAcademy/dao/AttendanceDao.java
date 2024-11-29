package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.AttendanceVO;

public interface AttendanceDao {
	// 학생 출결 조회 페이지 기준으로 만듦
	// 학생은 출결 정보 조회만 가능토록!
	
	// 출결 상세조회
	public AttendanceVO getAttendance(AttendanceVO vo);
	// 출결 목록조회
	public List<AttendanceVO> getAttendanceList(AttendanceVO vo);
	
}
