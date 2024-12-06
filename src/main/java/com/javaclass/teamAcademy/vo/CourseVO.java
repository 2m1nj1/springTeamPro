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
	
} // end of CourseVO
