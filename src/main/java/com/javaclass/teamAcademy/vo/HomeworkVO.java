package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
//@Alias("hvo")
public class HomeworkVO {
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함
	
	private int hw_course; // 강좌 번호
	private int course_instructor; // 담당 강사 번호
	private String course_name; //강좌 이름
	private String user_name; // 담당 강사 이름
	
	private int user_no; // (과제 조회하는) 학생 회원 번호 - parameter
	
	private int hw_no; // 과제 번호
	private String hw_title; // 과제명
	private String hw_context; // 과제 내용
	
	private int upload_no; // 첨부파일 번호
	private int pk_no; // 작성글 번호
	private int service_no; // 서비스 분류번호
	private String upload_location; // 첨부파일경로
	
	private String hw_startdate; // 과제 시작일
	private String hw_enddate; // 과제 제출 마감일
	private String hw_endtime; // 과제 제출 마감시각
	
	private String hw_submission_deadline = hw_startdate + " ~ " + hw_enddate; // 전체 과제 기한= hw_startdate + "~" + hw_enddate
	
	//제출여부 관련 booleans...
	private boolean isUploaded;
	private boolean isDeadlinePassed;
}