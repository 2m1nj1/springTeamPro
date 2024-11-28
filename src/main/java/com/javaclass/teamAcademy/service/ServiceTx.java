package com.javaclass.teamAcademy.service;

import com.javaclass.teamAcademy.vo.ExamVO;
import com.javaclass.teamAcademy.vo.GradeVO;

public interface ServiceTx {
	public void addAll(GradeVO svo, ExamVO evo) throws Exception;
}
