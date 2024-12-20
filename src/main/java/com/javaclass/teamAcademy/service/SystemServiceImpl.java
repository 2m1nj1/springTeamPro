package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.SystemDAO;
import com.javaclass.teamAcademy.vo.ChartVO;
import com.javaclass.teamAcademy.vo.ClassroomVO;
import com.javaclass.teamAcademy.vo.CourseStaVO;
import com.javaclass.teamAcademy.vo.EmailDomainVO;

@Service
public class SystemServiceImpl implements SystemService {

	@Autowired
	private SystemDAO systemDao;
	
	@Override
	public List<EmailDomainVO> selectEmailDomainList() {
		return systemDao.selectEmailDomainList();
	} // end of selectEmailDomainList()
	
	@Override
	public List<ClassroomVO> selectClassroomList(ClassroomVO vo) {
		return systemDao.selectClassroomList(vo);
	} // end of selectClassroomList()
	
	@Override
	public List<CourseStaVO> selectCourseStaList() {
		return systemDao.selectCourseStaList();
	} // end of selectCourseStaList()
	
	@Override
	public ClassroomVO selectClassroomDetail(ClassroomVO vo) {
		return systemDao.selectClassroomDetail(vo);
	} // end of selectClassroomDetail()

	@Override
	public void updateClassroom(ClassroomVO vo) {
		systemDao.updateClassroom(vo);
	} // end of updateClassroom()

	@Override
	public void deleteClassroom(ClassroomVO vo) {
		systemDao.deleteClassroom(vo);
	} // end of deleteClassroom()

	@Override
	public void insertClassroom(ClassroomVO vo) {
		systemDao.insertClassroom(vo);
	} // end of insertClassroom()

	@Override
	public int countCourse(String courseStaName) {
		return systemDao.countCourse(courseStaName);
	} // end of countCourse()

	@Override
	public List<String> selectsignUpYear() {
		return systemDao.selectsignUpYear();
	}

	@Override
	public List<ChartVO> chartStuCnt(String year) {
		return systemDao.chartStuCnt(year);
	}

	
} // end of SystemServiceImpl
