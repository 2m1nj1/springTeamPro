package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class CourseStaVO {

	private int 	course_status_no;		// 강좌상태번호(PK)
	private String 	course_status_name;		// 강좌상태명
	private String	course_status_eng;		// 강좌상태(변수생성용)

} // end of CourseStaVO
