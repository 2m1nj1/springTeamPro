package com.javaclass.teamAcademy.dao;

import java.util.List;
import java.util.Map;

import com.javaclass.teamAcademy.vo.AttendanceVO;
import com.javaclass.teamAcademy.vo.CourseVO;

public interface AttendanceDao {
	// 학생 출결 조회 페이지 기준으로 만듦
	// 학생은 출결 정보 조회만 가능토록!
	
	// [학생] nav bar 에 표시될 수강중인 강좌들 불러오기
	List<CourseVO> fetchOngoingCourses(int userNo);
	
	// 출결 목록조회
	List<AttendanceVO> fetchAttendanceRecords(Map<String, Object> params);
	
	/*
	 * // 총 데이터 개수 조회 int getTotalAttendanceCount(Map<String, Object> params);
	 */
}