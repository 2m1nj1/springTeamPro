package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.TchHomeworkVO;

public interface TchHomeworkDAO {
		public void insertHomework(TchHomeworkVO vo);
		
		public List<TchHomeworkVO> homeworkList(int user_no);
			
			
		

//		public TchHomeworkVO homework(TchHomeworkVO vo);
}
