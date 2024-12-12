package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.TchHomeworkDAO;
import com.javaclass.teamAcademy.vo.MessageVO;
import com.javaclass.teamAcademy.vo.TchHomeworkVO;

@Service
public class TchHomeworkServiceImpl implements TchHomeworkService {

	@Autowired
	private TchHomeworkDAO tchHomeworkDAO;
	
	public void insertHomework(TchHomeworkVO vo) {
		tchHomeworkDAO.insertHomework(vo);
	}
	
		// 과제 목록
	public List<TchHomeworkVO> homeworkList() {
		return tchHomeworkDAO.homeworkList();
	}

//	@Override
//	public TchHomeworkVO homework(TchHomeworkVO vo) {
//		return null;
//	}
	
//	// 과제 상세 
//	public TchHomeworkVO homework(TchHomeworkVO vo) { 	
//		return TchHomeworkDAO.homework(vo);
//	}
}
