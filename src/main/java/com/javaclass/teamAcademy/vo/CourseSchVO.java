package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class CourseSchVO {

	private int		course_schedule_no;	// 강좌 일정 번호 (PK)
	private	int		course_no;			// 강좌 번호 (FK)
	private	String	course_startTime;	// 수업 시작 시간
	private String	course_endTime;		// 수업 종료 시간
	private int		course_dayOfWeek;	// 수업 요일
	
} // end of CourseSchVO
