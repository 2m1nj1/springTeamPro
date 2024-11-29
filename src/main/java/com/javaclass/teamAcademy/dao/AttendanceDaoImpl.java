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
	public AttendanceVO getAttendance(AttendanceVO vo) {
		System.out.println("mybatis getAttendance() 호출");
		return (AttendanceVO) sqlsession.selectOne("AttendanceDao.getAttendance", vo);
	}
	// 출결 목록 조회
	public List<AttendanceVO> getAttendanceList(AttendanceVO vo) {
		System.out.println("mybatis getAttendanceList() 호출");
		return sqlsession.selectList("AttendanceDao.getAttendanceList", vo);
	}
}