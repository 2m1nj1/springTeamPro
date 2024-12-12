package com.javaclass.teamAcademy.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.HomeworkDoneVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;

public interface HomeworkService {
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함
	
	List<CourseVO> getLecturesByUser(int userNo);
	
    List<HomeworkVO> getHomeworkByCourse(int courseNo);
    
    HomeworkVO getHomeworkDetails(int hwNo);

	String saveFile(MultipartFile file) throws IOException;

	void saveHomeworkSubmission(HomeworkDoneVO homeworkDone);

	int saveUpload(int hwNo, String filePath);

	int getLastUploadId();

	boolean isHomeworkSubmitted(int hwNo, int userNo);

}