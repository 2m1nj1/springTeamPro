package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
//@Alias("cvo")
public class GradeVO {
	// [학생]성적 조회 기준으로 만들어짐 - grade table
	private String user_name; // 이름
	
	private int original_score; // 원점수 총합
	private int percentile_score; // 백분위 총합
	
	private int kor;  // 국어 점수
	private int math; // 수학 점수
	private int eng;  // 영어 점수
	  
	private boolean kor_took;  // 국어_응시여부 
	private boolean math_took; // 수학_응시여부
	private boolean eng_took;  // 영어_응시여부
	
}
