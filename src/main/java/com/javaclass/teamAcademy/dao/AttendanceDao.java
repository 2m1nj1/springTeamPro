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
	
	// 출석정보 DB 삽입
	public void insertAttendance(Map<String, Object> params);
	
	// 출석정보 수정(출석 -> 조퇴)
	public void updateAttendance(Map<String, Object> params);

	// 오늘의 출석기록 확인
	int checkAttendanceToday(int userNo, int courseNo);

	// 오늘의 조퇴기록 확인
	int checkPrematureLeaveToday(int userNo, int courseNo);

	// 강좌 시간 기록 물어옴.
	Map<String, String> fetchCourseTimings(int courseNo);
}