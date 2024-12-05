package com.javaclass.teamAcademy.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.AttendanceVO;
import com.javaclass.teamAcademy.vo.CourseVO;

@Repository
public class AttendanceDaoImpl implements AttendanceDao{
	// 학생 출결 조회 페이지 기준으로 만듦
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	//private static final String NAMESPACE = "com.javaclass.teamAcademy.mapper.AttendanceDao";
	
	// [학생] nav bar 에 표시될 수강중인 강좌들 불러오기
	@Override
	public List<CourseVO> fetchOngoingCourses(int userNo) {
		System.out.println("Dao Layer fetchOngoingCourses() 호출" + userNo);
		List<CourseVO> courses = sqlsession.selectList( "AttendanceDao.fetchOngoingCourses", userNo );
		System.out.println("Courses fetched: " + courses);
		return courses;
	}

	// 출결 목록 조회
	@Override
	public List<AttendanceVO> fetchAttendanceRecords(Map<String, Object> params) {
		return sqlsession.selectList( "AttendanceDao.fetchAttendanceRecords", params );
	}
	
	/*
	 * // 출결 기록 전체 갯수 가져오기...
	 * 
	 * @Override public int getTotalAttendanceCount(Map<String, Object> params) {
	 * return sqlsession.selectOne( "AttendanceDao.getTotalAttendanceCount",
	 * params); }
	 */
}