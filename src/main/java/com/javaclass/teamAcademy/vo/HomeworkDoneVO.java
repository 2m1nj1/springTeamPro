package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class HomeworkDoneVO {
	
	private int doneNo;      // HW 제출 ID (PK)
	private int hwNo;        // Homework ID (FK)
	private int userNo; // 과제 제출한 학생의 ID( homework_done 삽입용 )
	
	private String doneTitle; // 제출일시 (handled by NOW() in the query)
	private String doneContext; // 제출일시 (handled by NOW() in the query)
	private String doneDate; // 제출일시 (handled by NOW() in the query)
	private int uploadNo;    // Uploaded file ID (FK)
	
}
