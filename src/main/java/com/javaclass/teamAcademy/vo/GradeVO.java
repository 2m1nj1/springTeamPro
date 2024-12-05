package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class GradeVO {
	// [학생]성적 조회 기준으로 만들어짐 - grade table
	
	private int grade_no;			// PK
	private int exam_no;			// FK - exam 테이블 참조, join
	private int user_no;			// FK - user_account 테이블 참조, join
	private int original_score;		// 원점수
	private int percentile_score;	// 백분위 점수
	private int kor;				// 국어
	private int math;				// 수학
	private int eng;				// 영어
	private int kor_took;		// 국어 시험 응시여부
	private int math_took;		// 수학 시험 응시여부
	private int eng_took;		// 영어 시험 응시여부
	private String user_name;		// 유저[학생] 이름 user_account 테이블서 가져와야 하는 값.
	private String exam_name;		// 유저[학생] 이 본 시험 이름 exam 테이블서 가져와야 하는 값.
	
	private String exam_context;// exam 세부사항
	private String exam_date;	// exam date
}
