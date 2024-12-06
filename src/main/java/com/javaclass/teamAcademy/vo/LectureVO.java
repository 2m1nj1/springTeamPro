package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class LectureVO {

	private int 	lecture_no;			// 강의번호 (PK)
	private String 	course_no;			// 강좌번호 (FK)
	private String	lecture_rownum;		// 회차번호
	private String	lecture_name;		// 강의명
	private String	lecture_detail;		// 세부내용
	
} // end of LectureVO
