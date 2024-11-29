package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class UserVO {
	
	private int 	user_no;			// 회원 번호
	private int 	user_cate_no;		// 회원 분류 번호 (1: 수강생 / 2: 강사 / 3: 관리자)
	private String 	user_id;			// 아이디
	private String 	user_pass;			// 비밀번호
	private String	user_name;			// 이름
	private String	user_CI;			// CI 번호
	private String	user_email;			// 이메일
	private String	user_addr;			// 주소
	private String	user_tel;			// 개인 연락처
	private String	user_parent_tel;	// 보호자 연락처
	private String 	user_birthday;		// 생일
	private String	user_signupdate;	// 가입
	private String	user_school;		// 학교
	private String 	user_grade;			// 학년
	
	
} // end of UserVO
