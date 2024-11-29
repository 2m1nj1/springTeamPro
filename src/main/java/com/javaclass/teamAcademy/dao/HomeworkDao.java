package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.HomeworkVO;

public interface HomeworkDao {
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함
	
	// 과제 상세보기
	public HomeworkVO getHomework(HomeworkVO vo);
	
	// 과제 목록 가져오기
	public List<HomeworkVO> getHomeworkList(HomeworkVO vo);
	
	// 과제 제출 - 수정.
	public void updateHomework(HomeworkVO vo);
}
