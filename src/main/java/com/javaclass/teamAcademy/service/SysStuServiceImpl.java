package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.SysStuDAO;
import com.javaclass.teamAcademy.vo.UserVO;

@Service
public class SysStuServiceImpl implements SysStuService {

	@Autowired
	private SysStuDAO sysStuDao;
	
	@Override
	public int selectStuAllCount() {
		return sysStuDao.selectStuAllCount();
	} // end of selectStuCount()
	
	@Override
	public List<UserVO> selectStuList() {
		return sysStuDao.selectStuList();
	} // end of selectStuList()

	@Override
	public UserVO selectStuDetail(UserVO vo) {
		return sysStuDao.selectStuDetail(vo);
	} // end of selectStuDetail()

	@Override
	public void updateStuDetail(UserVO vo) {
		sysStuDao.updateStuDetail(vo);
	} // end of updateStuDetail()
	
	
	@Override
	public void deleteStu(UserVO vo) {
		sysStuDao.deleteStu(vo);
	} // end of deleteStu()
	
	@Override
	public void insertStu(UserVO vo) {
		sysStuDao.insertStu(vo);
	} // end of insertStu()

	
	
} // end of ListService
