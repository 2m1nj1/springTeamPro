package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class CourseVO {
	// 수강생 출결조회시 CourseVO 에 다녀오는 형태로 짜놓음. 추후 추합해야함.
	private int course_no;		// CourseNo
	private String course_name; // COurseName
}
