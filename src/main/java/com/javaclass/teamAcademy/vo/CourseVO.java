package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class CourseVO {
	
	private int 	course_no;			// 강좌 번호 (PK)
	private String 	course_name; 		// 강좌명
	private String	course_instructor;	// 담당 강사 (FK)
	private String	course_startDate;	// 강좌 시작일
	private String	course_endDate;		// 강좌 종료일
	private	String	course_classroom;	// 강의실 (FK)
	private String	course_maxPerson;	// 정원
	private String	course_fee;			// 수강료
	private String	course_cate_no;		// 강좌 분류 (FK)
	private String	course_status;		// 강좌 상태
	
	
	// join getter
	private String	classroom_name;		// 강의실 이름
	private String	course_days;		// 강의 요일
	private String	course_person;		// 수강 인원 / 정원
	private String	course_sch;			// 강좌 일정 (1개)
	
} // end of CourseVO
