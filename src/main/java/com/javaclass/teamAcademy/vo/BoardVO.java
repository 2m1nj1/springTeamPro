package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class BoardVO {

	private Integer board_No;
	private Integer board_Writer;
	private String board_Cate;
	private String board_Title;
	private String board_Context;
	private Integer board_Cnt;
	private String board_Fixtop;
	private String board_Date;
}
