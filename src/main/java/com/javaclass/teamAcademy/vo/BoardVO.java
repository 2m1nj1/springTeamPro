package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int board_no;			// 게시글 번호
	private int board_writer;		// 게시글 작성자
	private String board_cate; 		// 게시판명
	private String board_title;		// 게시글 제목
	private String board_context;	// 게시글 내용
	private int board_cnt;			// 조회수
	private String board_fixtop;	// 상단 고정 여부
	
}
