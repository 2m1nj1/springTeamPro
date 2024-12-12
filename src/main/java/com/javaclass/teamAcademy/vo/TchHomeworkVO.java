package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class TchHomeworkVO {

		private Integer hw_no;			 // 과제번호
		private Integer hw_course;		 // 강좌번호 course_no
		private String  hw_title; 		 // 과제명
		private String  hw_context; 	 // 과제내용
		private String  hw_startdate;	 // 과제시작일
		private String  hw_enddate; 	 // 과제마감일
		private Integer upload_no;		 // 첨부파일번호 upload_no
		
		private Integer service_no;		 // 서비스분류번호
		private Integer pk_no;			 // 작성글번호
		private String  upload_location; // 첨부파일경로
		
		private String  user_name;		 // 사용자 이름
		private String  user_no;			// 회원번호
	
	
}
