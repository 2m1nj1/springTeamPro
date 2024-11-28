package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class HomeworkVO {

	private int hw_course; // 강좌 번호
	private int course_instructor; // 담당 강사 번호
	private String couse_name; //강좌 이름
	private String ins_name; // 담당 강사 이름
	
	private int user_no; // (과제 조회하는) 학생 회원 번호
	
	private int hw_no; // 과제 번호
	private String hw_title; // 과제명
	private String hw_context; // 과제 내용
	private int upload_no; // 첨부파일 번호
	
	private String hw_startdate; // 과제 시작일
	private String hw_enddate; // 과제 마감일
	private String hw_period = hw_startdate + "~" + hw_enddate; // 전체 과제 기한.
}
