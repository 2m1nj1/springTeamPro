package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.HomeworkVO;

@Repository
public class HomeworkDaoImpl implements HomeworkDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public HomeworkVO getHomework(HomeworkVO vo) {
		System.out.println("homework 하나 상세보기");
		return sqlSession.selectOne("HomeworkDao.getHomework", vo);
	}

	@Override
	public List<HomeworkVO> getHomeworkList(HomeworkVO vo) {
		System.out.println("homework 전체 목록 조회");
		return sqlSession.selectList("HomeworkDao.getHomeworkList", vo);
	}

	@Override
	public void updateHomework(HomeworkVO vo) {
		System.out.println("학생 과제 파일 올리기 update 로 구현");
		sqlSession.update("HomeworkDao.updateHomework", vo);
	}
}
