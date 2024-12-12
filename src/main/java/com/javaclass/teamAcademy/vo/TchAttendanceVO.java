package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class TchAttendanceVO {

	private Integer attendance_no;			// 출결번호
	private Integer course_no; 				// 강좌번호
	private Integer user_no;				// 회원번호
	private String 	attendance_date;		// 출결일시
	private String 	attendance_status_no;	// 출결상태
	private String  user_tel;				// 회원연락처
	private String  course_name;			// 강좌명
	private String  user_name;				// 회원명	
	
}
