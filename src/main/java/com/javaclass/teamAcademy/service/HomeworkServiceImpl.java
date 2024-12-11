package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.HomeworkDaoImpl;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함

	@Autowired
	private HomeworkDaoImpl homeworkDao;

	@Override
    public List<CourseVO> getLecturesByUser(int userNo) {
        return homeworkDao.getLecturesByUser(userNo);
    } // end of getLecturesByUser

    @Override
    public List<HomeworkVO> getHomeworkByCourse(int courseNo) {
        return homeworkDao.getHomeworkByCourse(courseNo);
    } // end of getHomeworkByCourse

	@Override
	public HomeworkVO getHomeworkDetails(int hwNo) {
		HomeworkVO hw = homeworkDao.getHomeworkDetails(hwNo);
		System.out.println("서비스단 HomeworkVO 물어오기 : " + hw);
		return hw;
	} // end of getHomeworkDetails

} // end of HomeworkServiceImpl