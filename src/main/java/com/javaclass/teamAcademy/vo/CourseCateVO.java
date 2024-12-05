package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class CourseCateVO {

	private int 	course_cate_no;		// 강좌 분류 번호
	private String	course_cate_name;	// 강좌 분류 명
	private int		course_cate_upno;	// 상위 강좌 분류 번호
	
} // end of CourseCateVO
