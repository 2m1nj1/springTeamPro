package com.javaclass.teamAcademy.service;

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
	
	/*
	 * // 출결 기록 전체 갯수 가져오기...
	 * 
	 * @Override public int getTotalAttendanceCount(Map<String, Object> params) {
	 * return adao.getTotalAttendanceCount(params); }
	 */
}
