package com.javaclass.teamAcademy.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaclass.teamAcademy.dao.HomeworkDaoImpl;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.HomeworkDoneVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	// 학생의 과제 목록 조회, 과제 상세보기, 과제 제출 기준으로 작성함

	@Autowired
	private HomeworkDaoImpl homeworkDao;

	// 유저에 따른 강좌 목록 불러오기
	@Override
    public List<CourseVO> getLecturesByUser(int userNo) {
		List<CourseVO> list = homeworkDao.getLecturesByUser(userNo);
		System.out.println("Courses retrieved: " + list);
        return list;
    } // end of getLecturesByUser

	
	// 강좌에 따른 과제목록 불러오기
    @Override
    public List<HomeworkVO> getHomeworkByCourse(int courseNo) {
        return homeworkDao.getHomeworkByCourse(courseNo);
    } // end of getHomeworkByCourse

    
    // 과제 상세정보 물어오기
	@Override
	public HomeworkVO getHomeworkDetails(int hwNo) {
		HomeworkVO hw = homeworkDao.getHomeworkDetails(hwNo);
		System.out.println("서비스단 HomeworkVO 물어오기 : " + hw);
		return hw;
	} // end of getHomeworkDetails

	
	// 파일 저장
	@Override
	public String saveFile(MultipartFile file) throws IOException{
		if (file.isEmpty()) {
	        throw new IllegalArgumentException("File is empty");
	    }

	    // 업로드 디렉토리 정의.
	    String uploadDir = "C:/uploads/homework/";
	    File directory = new File(uploadDir);

	    // 없으면 디렉토리 생성.
	    if (!directory.exists()) {
	        directory.mkdirs();
	    }

	    // 유일한 파Generate a unique filename
	    String uniqueFilename = UUID.randomUUID() + "_" + file.getOriginalFilename();
	    String filePath = uploadDir + uniqueFilename;

	    // 서버에 파일 저장.
	    File destination = new File(filePath);
	    file.transferTo(destination);

	    return filePath; // 저장된 파일 경로 반환.
	}// end of saveFile

	
	// 업로딩 저장하기
	@Override
	public int saveUpload(int hwNo, String filePath) {
		if ( hwNo <= 0 || filePath == null || filePath.isEmpty()) {
	        throw new IllegalArgumentException("Invalid hwNo or filePath");
	    }
		System.out.println("파일 경로 : " + filePath + ", hwNo : " + hwNo );
		int saveUpload = homeworkDao.saveUpload(hwNo, filePath);
		System.out.println("saveUpload 메소드 saveUpload : " + saveUpload);
		return saveUpload;
	}// end of saveUpload

	
	// 과제 제출 저장하기
	@Override
	public void saveHomeworkSubmission(HomeworkDoneVO homeworkDone) {
		System.out.println("saveHomeworkSubmission 호출! : " + homeworkDone );
		homeworkDao.saveHomeworkSubmission(homeworkDone);
	}// end of saveHomeworkSubmission

} // end of HomeworkServiceImpl