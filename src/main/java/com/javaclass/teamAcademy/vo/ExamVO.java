package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class ExamVO {
	private int exam_no;		// exam 번호
	private String exam_name;	// exam 이름
	private String exam_context;// exam 세부사항
	private String exam_date;	// exam date
	private String year;		// 연도	
	
	// 가져와서 저장해 놓을 타 DB 값
	private int original_score; // 원점수.
	private int user_no;		// user_no
	private String user_name;	// user_name (user_account 테이블 것.)
}
