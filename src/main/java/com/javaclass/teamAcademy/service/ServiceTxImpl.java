package com.javaclass.teamAcademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaclass.teamAcademy.dao.ExamDao;
import com.javaclass.teamAcademy.javassem.dao.GradeDao;
import com.javaclass.teamAcademy.vo.ExamVO;
import com.javaclass.teamAcademy.vo.GradeVO;

@Service
public class ServiceTxImpl implements ServiceTx{

	@Autowired
	private ExamDao edao;
	@Autowired
	private GradeDao sdao;
	//각자 Autowired 걸어줘야만 함 기억해줘요

	//#########
	@Transactional
	@Override
	public void addAll(GradeVO svo, ExamVO evo) throws Exception {
		// TODO Auto-generated method stub
		edao.insertExam(evo);
		System.out.println("ExamOK");
		sdao.insertGrade(svo);
		System.out.println("GradeOK");
	}
}