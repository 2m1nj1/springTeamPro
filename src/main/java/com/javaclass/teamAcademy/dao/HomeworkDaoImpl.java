package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;

@Repository
public class HomeworkDaoImpl implements HomeworkDao {

    @Autowired
    private SqlSession sqlSession;

    // userNo 에 따라 강좌목록 불러오기
    @Override
    public List<CourseVO> getLecturesByUser(int userNo) {
    	System.out.println("Dao getLecturesByUser 호출! userNo : " + userNo);
        List<CourseVO> lectures = sqlSession.selectList("HomeworkDao.getLecturesByUser", userNo);
        System.out.println("Fetched lectures : " + lectures);
        return lectures;
    }// end of getLecturesByUser

    // 강좌에 따른 과제 목록 불러오기
    @Override
    public List<HomeworkVO> getHomeworkByCourse(int courseNo) {
    	System.out.println("Dao getHomeworkByCourse 호출! courseNo : " + courseNo);
    	List<HomeworkVO> homeworks = sqlSession.selectList("HomeworkDao.getHomeworkByCourse", courseNo);
    	System.out.println("Fetched homeworks : " + homeworks);
        return homeworks;
    }// end of getHomeworkByCourse

    // 강좌 상세정보 불러오기
	@Override
	public HomeworkVO getHomeworkDetails(int hwNo) {
		System.out.println("Dao getHomeworkDetails 호출! hwNo : " + hwNo);
		HomeworkVO hwInfo = sqlSession.selectOne("HomeworkDao.getHomeworkDetails", hwNo); // 매퍼
		System.out.println("Dao(레포지토리) hwInfo 물어옴: " + hwInfo);
		return hwInfo;
	}// end of getHomeworkDetails
       
}// end of HomeworkDaoImpl
