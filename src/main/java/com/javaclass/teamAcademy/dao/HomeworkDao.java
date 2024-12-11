package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.HomeworkDoneVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;

public interface HomeworkDao {
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함
	
    List<CourseVO> getLecturesByUser(int userNo);
    
    List<HomeworkVO> getHomeworkByCourse(int courseNo);

    HomeworkVO getHomeworkDetails(int hwNo);
    
    public void saveHomeworkSubmission(HomeworkDoneVO homeworkDone);
    
    public String saveFile(MultipartFile file);

	int saveUpload(int hwNo, String filePath);
}
