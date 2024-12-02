package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.UserVO;

@Repository
public class SysTchDAOImpl implements SysTchDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int selectTchAllCount() {
		return mybatis.selectOne("SysTchDAO.selectTchAllCount");
	} // end of selectStuCount()
	
	@Override
	public List<UserVO> selectTchList(UserVO vo) {
		
		System.out.println(">> repo 에서 받은 인자 값 : " + vo.toString());
		List<UserVO> result =  mybatis.selectList("SysTchDAO.selectTchList", vo);
		
		for(UserVO temp : result) {
			System.out.println(">> " + temp.toString() );
		}
		return result;
	} // end of selectTchList()


	@Override
	public UserVO selectTchDetail(UserVO vo) {
		return mybatis.selectOne("SysTchDAO.selectTchDetail", vo);
	} // end of selectStuDetail()

	@Override
	public void updateTchDetail(UserVO vo) {
		mybatis.update("SysTchDAO.updateTchDetail",vo);
	} // end of updateTchDetail()
	
	@Override
	public void deleteTch(UserVO vo) {
		mybatis.update("SysTchDAO.deleteTch", vo);
	} // end of deleteTch()
	
	@Override
	public void insertTch(UserVO vo) {
		mybatis.insert("SysTchDAO.insertTch", vo);
	} // end of insertStu()

	
	
} // end of ListDaoImpl
