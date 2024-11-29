package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.HomeworkVO;

public interface HomeworkService {
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함
	
	// 과제 상세보기
	HomeworkVO getHomework(HomeworkVO vo);
	
	// 과제 목록 조회
	List<HomeworkVO> getHomeworkList(HomeworkVO vo);
	
	// 과제 제출 - update
	void updateHomework(HomeworkVO vo);
}
