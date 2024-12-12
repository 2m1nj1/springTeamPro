package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.SysTchDAO;
import com.javaclass.teamAcademy.vo.UserVO;

@Service
public class SysTchServiceImpl implements SysTchService {

	@Autowired
	private SysTchDAO sysTchDao;
	
	@Override
	public int selectTchAllCount() {
		return sysTchDao.selectTchAllCount();
	} // end of selectStuCount()
	
	@Override
	public int selectTchRegiCount() {
		return sysTchDao.selectTchRegiCount();
	}
	
	@Override
	public int selectTchSecCount() {
		return sysTchDao.selectTchSecCount();
	}
	
	@Override
	public List<UserVO> selectTchList(UserVO vo) {
		return sysTchDao.selectTchList(vo);
	} // end of selectTchList()
	
	
	@Override
	public List<UserVO> selectTchRegi() {
		return sysTchDao.selectTchRegi();
	}

	@Override
	public List<UserVO> selectTchNotRegi() {
		return sysTchDao.selectTchNotRegi();
	}

	@Override
	public List<UserVO> selectTchSec() {
		return sysTchDao.selectTchSec();
	}
	
	
	@Override
	public UserVO selectTchDetail(UserVO vo) {
		return sysTchDao.selectTchDetail(vo);
	} // end of selectTchDetail()

	@Override
	public void updateTchDetail(UserVO vo) {
		sysTchDao.updateTchDetail(vo);
	} // end of updateTchDetail()
	
	
	@Override
	public void deleteTch(UserVO vo) {
		sysTchDao.deleteTch(vo);
	} // end of deleteTch()
	
	@Override
	public void insertTch(UserVO vo) {
		sysTchDao.insertTch(vo);
	} // end of insertStu()

	
	
	
} // end of ListService
