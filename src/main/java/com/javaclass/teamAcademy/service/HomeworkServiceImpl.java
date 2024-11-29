package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.HomeworkDaoImpl;
import com.javaclass.teamAcademy.vo.HomeworkVO;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함

	@Autowired
	private HomeworkDaoImpl hwDao;

	// 과제 상세보기
	@Override
	public HomeworkVO getHomework(HomeworkVO vo) {
		return hwDao.getHomework(vo);
	}

	// 과제 목록 가져오기
	@Override
	public List<HomeworkVO> getHomeworkList(HomeworkVO vo) {
		return hwDao.getHomeworkList(vo);
	}

	// 과제 제출 - 수정.
	@Override
	public void updateHomework(HomeworkVO vo) {
		hwDao.updateHomework(vo);
	}
}
