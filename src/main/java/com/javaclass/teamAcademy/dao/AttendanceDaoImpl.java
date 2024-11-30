package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.AttendanceVO;

@Repository
public class AttendanceDaoImpl implements AttendanceDao{
	// 학생 출결 조회 페이지 기준으로 만듦
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 출결 상세조회
	public AttendanceVO getAttendanceDetail(AttendanceVO vo) {
		System.out.println("mybatis getAttendance() 호출");
		return (AttendanceVO) sqlsession.selectOne("AttendanceDao.getAttendance", vo);
	}
	// 출결 목록 조회
	public List<AttendanceVO> getAttendanceList(AttendanceVO vo) {
		System.out.println("mybatis getAttendanceList() 호출");
		return sqlsession.selectList("AttendanceDao.getAttendanceList", vo);
	}
	// [학생] nav bar 에 표시될 수강중인 강좌들 불러오기
	@Override
	public List<String> getCoursesByStudent(int user_no) {
		System.out.println("mybatis getCoursesByStudent() 호출");
		return sqlsession.selectList("AttendanceDao.getCoursesByStudent", user_no);
	}
}