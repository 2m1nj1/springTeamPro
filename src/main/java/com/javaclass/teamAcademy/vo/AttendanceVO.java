package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class AttendanceVO {
	// 학생 출결 조회 페이지 기준으로 만듦
	private String attendance_date;		// 출석일시
	private String course_name;			// 강의명
	private String course_instructor;	// 담당 강사
	private String attendance_status;	// 출석/조퇴/결석 상황
	
	private int user_no; // 출석부 열람하려는 학생 번호
	private int course_no; // 출석부 열람하려는 강좌 번호(수강생이 수강 중인 강의임)
}