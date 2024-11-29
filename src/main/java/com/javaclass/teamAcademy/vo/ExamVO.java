package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
//@Alias("mvo")
public class ExamVO {
	// [학생]성적 조회 기준으로 만들어짐 - exam table
	private String exam_date; // 시험 일자
	private String exam_name; // 시험명
	private String exam_no; // 수험 번호
}
