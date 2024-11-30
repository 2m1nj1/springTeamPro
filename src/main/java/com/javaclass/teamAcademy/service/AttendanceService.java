package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.AttendanceVO;

public interface AttendanceService {
	// 학생 출결 조회 페이지 기준으로 만듦
	// 출석 조회만 할 수 있어야 함;
	
	// 출석 상세 조회
	AttendanceVO getAttendanceDetail(AttendanceVO vo);
	
	// 출석 목록 조회
	List<AttendanceVO> getAttendanceList(AttendanceVO vo);

	// 학생 아이디로 강좌 목록
	List<String> getCoursesByStudent(int user_no);
	
}
