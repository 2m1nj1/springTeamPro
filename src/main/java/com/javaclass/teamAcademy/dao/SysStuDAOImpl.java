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
	
} // end of ListDaoImpl
