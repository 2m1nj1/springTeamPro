package com.javaclass.teamAcademy.service;

import java.util.List;


import com.javaclass.teamAcademy.vo.TchHomeworkVO;

public interface TchHomeworkService {

	
		// 과제 작성
		void insertHomework(TchHomeworkVO vo);
	
		// 과제 목록
		List<TchHomeworkVO> homeworkList(int user_no);
		
//		// 과제 상세 조회
//		TchHomeworkVO homework(TchHomeworkVO vo);
}

