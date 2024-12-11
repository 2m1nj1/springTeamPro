package com.javaclass.teamAcademy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.AttendanceDao;
import com.javaclass.teamAcademy.vo.AttendanceVO;
import com.javaclass.teamAcademy.vo.CourseVO;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	// 학생 출결 조회 페이지 기준으로 만듦
	
	@Autowired
	private AttendanceDao adao;
	
	
	// [학생] nav bar 에 표시될 수강중인 강좌들 불러오기  
	@Override
	public List<CourseVO> getOngoingCourses(int userNo) {
		System.out.println("Service Layer - OngoingCourses for userNo " + userNo );
        return adao.fetchOngoingCourses(userNo);
    }

	// 출결 목록 가져오기
	@Override
	public List<AttendanceVO> getAttendanceRecords(Map<String, Object> params) {
		// 비었거나 null 값인 parameter 들 삭제.
		params.entrySet().removeIf( entry -> entry.getValue() == null || entry.getValue().toString().trim().isEmpty());
		
		System.out.println("Service Layer - getAttendanceList for params :" + params);
		return adao.fetchAttendanceRecords(params);
	}

	// 출석 (1)
	@Override
	public void markAttendance(int userNo, int courseNo, int attendanceStatus) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("userNo", userNo);
	    params.put("courseNo", courseNo);
	    params.put("attendanceStatus", attendanceStatus);
	    adao.insertAttendance(params);
	}

	// 조퇴 (3) 로 수정
	@Override
	public void markEarlyLeave(int userNo, int courseNo, int attendanceStatus) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("userNo", userNo);
	    params.put("courseNo", courseNo);
	    params.put("attendanceStatus", attendanceStatus);
	    adao.updateAttendance(params);
	}

	// 오늘 출석기록 확인
	@Override
	public boolean checkAttendanceToday(int userNo, int courseNo) {
		return adao.checkAttendanceToday(userNo, courseNo) > 0;
	}

	// 오늘 결석기록 확인
	@Override
	public boolean checkPrematureLeaveToday(int userNo, int courseNo) {
		return adao.checkPrematureLeaveToday(userNo, courseNo) > 0;
	}

	// 강좌 시간 정보 물어옴
	@Override
	public Map<String, String> getCourseTimings(int courseNo) {
		return adao.fetchCourseTimings(courseNo);
	}
	
}
