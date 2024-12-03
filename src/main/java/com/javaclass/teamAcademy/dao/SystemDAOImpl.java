package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.ClassroomVO;
import com.javaclass.teamAcademy.vo.EmailDomainVO;

@Repository
public class SystemDAOImpl implements SystemDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	@Override
	public List<EmailDomainVO> selectEmailDomainList() {
		return mybatis.selectList("SystemDAO.selectEmailDomainList");
	} // end of selectEmailDomainList()
	
	@Override
	public List<ClassroomVO> selectClassroomList(ClassroomVO vo) {
		return mybatis.selectList("SystemDAO.selectClassroomList", vo);
	} // end of selectClassroomList

	@Override
	public ClassroomVO selectClassroomDetail(ClassroomVO vo) {
		return mybatis.selectOne("SystemDAO.selectClassroomDetail", vo);
	} // end of selectClassroomDetail()

	@Override
	public void updateClassroom(ClassroomVO vo) {
		mybatis.update("SystemDAO.updateClassroom", vo);
	} // end of updateClassroom()

	@Override
	public void deleteClassroom(ClassroomVO vo) {
		mybatis.delete("SystemDAO.deleteClassroom", vo);
	} // end of deleteClassroom()

	@Override
	public void insertClassroom(ClassroomVO vo) {
		mybatis.insert("SystemDAO.insertClassroom", vo);
	} // end of insertClassroom()

	
	

} // end of SystemDAOImpl
