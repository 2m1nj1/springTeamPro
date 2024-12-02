package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<UserVO> selectStuList() {	
		return mybatis.selectList("SysStuDAO.selectStuList");
	} // end of selectStuList()


	@Override
	public UserVO selectStuDetail(UserVO vo) {
		return mybatis.selectOne("SysStuDAO.selectStuDetail", vo);
	} // end of selectStuDetail()

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
