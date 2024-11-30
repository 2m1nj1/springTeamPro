package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class HomeworkDoneVO {
	private int doneNo;      // HW 제출 ID (PK)
	private int userNo;      // 과제 제출한 학생의 ID
	private int hwNo;        // Homework ID (FK)
	private int uploadNo;    // Uploaded file ID (FK)
	private String doneDate; // 제출일시 (handled by NOW() in the query)
}
