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

	// 출석 정보 삽입
	void markAttendance(int userNo, int courseNo, int attendanceStatus);

	// 출석정보 수정(출석 -> 조퇴)
	void markEarlyLeave(int userNo, int courseNo, int attendanceStatus);

	// 오늘의 출결기록 확인
	boolean checkAttendanceToday(int userNo, int courseNo);

	// 오늘의 조퇴기록 확인
	boolean checkPrematureLeaveToday(int userNo, int courseNo);

	// 강좌 시간 물어오기
	Map<String, String> getCourseTimings(int courseNo);
}
