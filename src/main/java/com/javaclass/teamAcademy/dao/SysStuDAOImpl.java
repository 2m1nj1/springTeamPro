package com.javaclass.teamAcademy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.UserVO;

@Repository
public class SysStuDAOImpl implements SysStuDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int selectStuAllCount() {
		return mybatis.selectOne("SysStuDAO.selectStuAllCount");
	} // end of selectStuCount()
	
	@Override
	public int selectStuRegiCount() {
		return mybatis.selectOne("SysStuDAO.selectStuRegiCount");
	} // end of selectStuRegiCount()
	
	@Override
	public int selectStuSecCount() {
		return mybatis.selectOne("SysStuDAO.selectStuSecCount");
	} // end of selectStuSecCount()
	
	@Override
	public List<UserVO> selectStuRegi() {
		return mybatis.selectList("SysStuDAO.selectStuRegi");
	}
	
	@Override
	public List<UserVO> selectStuNotRegi() {
		return mybatis.selectList("SysStuDAO.selectStuNotRegi");
	}

	@Override
	public List<UserVO> selectStuSec() {
		return mybatis.selectList("SysStuDAO.selectStuSec");
	}
	
	@Override
	public List<UserVO> selectStuList() {	
		return mybatis.selectList("SysStuDAO.selectStuList");
	} // end of selectStuList()


	@Override
	public UserVO selectStuDetail(UserVO vo) {
		return mybatis.selectOne("SysStuDAO.selectStuDetail", vo);
	} // end of selectStuDetail()
	
	@Override
	public List<CourseVO> selectStuDetailCourse(UserVO vo) {
		return mybatis.selectList("SysStuDAO.selectStuDetailCourse", vo);
	}
	
	@Override
	public List<CourseVO> stuDetailCourseCancel(String stuUserNo, String cancelCourse) {
		Map<String, Object> params = new HashMap<>();
		params.put("stuUserNo", stuUserNo);
		params.put("cancelCourse", cancelCourse);
		
		mybatis.update("SysStuDAO.stuDetailCourseCancel", params);
		
		UserVO vo = new UserVO();
		vo.setUser_no(Integer.parseInt(stuUserNo));
		return mybatis.selectList("SysStuDAO.selectStuDetailCourse", vo);
	}
	
	@Override
	public void updateStuDetail(UserVO vo) {
		mybatis.update("SysStuDAO.updateStuDetail",vo);
	} // end of updateStuDetail()
	
	@Override
	public void deleteStu(UserVO vo) {
		mybatis.update("SysStuDAO.deleteStu", vo);
	} // end of deleteStu()
	
	@Override
	public void insertStu(UserVO vo) {
		mybatis.insert("SysStuDAO.insertStu", vo);
	} // end of insertStu()

	
	

	
	
	

} // end of ListDaoImpl
