package com.javaclass.teamAcademy.service;

import java.util.List;
import java.util.Map;

import com.javaclass.teamAcademy.vo.AttendanceVO;
import com.javaclass.teamAcademy.vo.CourseVO;

public interface AttendanceService {
	// 학생 출결 조회 페이지 기준으로 만듦
	// 출석 조회만 할 수 있어야 함;


	// 학생 아이디로 해당 학생이 수강중인 강좌 목록
	List<CourseVO> getOngoingCourses(int userNo);

	// 출석 목록 조회
	List<AttendanceVO> getAttendanceRecords(Map<String, Object> params);
	
	/*
	 * // 출석 기록의 전체 갯수 불러옴
	 * int getTotalAttendanceCount(Map<String, Object> params);
	 */
	
}
