package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
//@Alias("avo")
public class AttendanceVO {
	// 학생 출결 조회 페이지 기준으로 만듦
	private String attendance_date;		// 출석일시
	private String course_name;			// 강의명
	private String course_instructor;	// 담당 강사
	private String attendance_status;	// 출석/조퇴/결석 상황
}
