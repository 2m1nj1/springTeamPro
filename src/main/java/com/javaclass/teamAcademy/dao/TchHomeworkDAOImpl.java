package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.TchHomeworkVO;

@Repository
public class TchHomeworkDAOImpl implements TchHomeworkDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertHomework(TchHomeworkVO vo) {
		System.out.println("===> Mybatis insertHomework() 호출" + vo.toString());
		mybatis.insert("TchHomeworkDAO.insertHomework", vo);
		System.out.println("[insertHomework] 결과: ");
		
	}
	
	public List<TchHomeworkVO> homeworkList() {
		System.out.println("===> Mybatis homeworkList() 호출");
		// 상세 목록
		List<TchHomeworkVO> listResult = mybatis.selectList("TchHomeworkDAO.homeworkList");
		System.out.println("[homeworkList] 결과: "+ listResult);
		return listResult;
	}
	
//	public TchHomeworkVO homework(TchHomeworkVO vo) {
//		System.out.println("===> Mybatis homework() 호출 " + vo.toString() );
//		TchHomeworkVO result = mybatis.selectOne("TchHomeworkDAO.homework", vo);
//		System.out.println("[homework] 결과: "+ result);
//		return result;
//	}
	
	
	
	
	
}
