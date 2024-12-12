package com.javaclass.teamAcademy.dao;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.HomeworkDoneVO;
import com.javaclass.teamAcademy.vo.HomeworkVO;

@Repository
public class HomeworkDaoImpl implements HomeworkDao {

    @Autowired
    private SqlSession sqlSession;

    // userNo 에 따라 강좌목록 불러오기
    @Override
    public List<CourseVO> getLecturesByUser(int userNo) {
    	System.out.println("Dao getLecturesByUser 호출! userNo : " + userNo);
        List<CourseVO> lectures = sqlSession.selectList("HomeworkDao.getLecturesByUser", userNo);
        System.out.println("Fetched lectures : " + lectures);
        return lectures;
    }// end of getLecturesByUser

    
    // 강좌에 따른 과제 목록 불러오기
    @Override
    public List<HomeworkVO> getHomeworkByCourse(int courseNo) {
    	System.out.println("Dao getHomeworkByCourse 호출! courseNo : " + courseNo);
    	List<HomeworkVO> homeworks = sqlSession.selectList("HomeworkDao.getHomeworkByCourse", courseNo);
    	System.out.println("Fetched homeworks : " + homeworks);
        return homeworks;
    }// end of getHomeworkByCourse
    
    
    // 과제 제출여부 판단
 	public boolean isHomeworkSubmitted(int hwNo, int userNo) {
 		Integer count = sqlSession.selectOne("HomeworkDao.isHomeworkSubmitted", Map.of("hwNo", hwNo, "userNo", userNo));
 	    return count != null && count > 0;
 	}// end of isHomeworkSubmitted
    

    // 강좌 상세정보 불러오기
	@Override
	public HomeworkVO getHomeworkDetails(int hwNo) {
		System.out.println("Dao getHomeworkDetails 호출! hwNo : " + hwNo);
		HomeworkVO hwInfo = sqlSession.selectOne("HomeworkDao.getHomeworkDetails", hwNo); // 매퍼
		System.out.println("Dao(레포지토리) hwInfo 물어옴: " + hwInfo);
		return hwInfo;
	}// end of getHomeworkDetails

	
	@Override
	public void saveHomeworkSubmission(HomeworkDoneVO homeworkDone) {
		sqlSession.insert("HomeworkDao.saveHomeworkSubmission", homeworkDone);		
	}// end of saveHomeworkSubmission

	
	// 업로딩 저장하기
	@Override
	public int saveUpload(int hwNo, String filePath) {
		if (filePath == null || filePath.isEmpty()) {
	        throw new IllegalArgumentException("Invalid file path for upload!");
	    }// end of if
		Map<String, Object> params = new HashMap<>();
		
		System.out.println("DAO) Saving upload with - hwNo : " + hwNo + " filePath : " + filePath + " params : " + params);
		
	    params.put("hwNo", hwNo);
	    params.put("filePath", filePath);
	    params.put("serviceNo", 3);
	    
	    int a = sqlSession.insert("HomeworkDao.saveUpload", params);
	    System.out.println("saveUpload : " + a);
	    return a;
	}// end of saveUpload

	
	// 파일 저장
	@Override
	public String saveFile(MultipartFile file) {
		String uuid = UUID.randomUUID().toString();
	    String originalFilename = file.getOriginalFilename();
	    String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
	    String uniqueFilename = uuid + fileExtension;

	    // Use a dynamic, server-safe upload directory
	    String uploadDir = "/server/uploads/homework/";
	    File destination = new File(uploadDir, uniqueFilename);
	    if (!destination.getParentFile().exists()) {
	        destination.getParentFile().mkdirs();
	    }
	    try {
			file.transferTo(destination);
		} catch (IllegalStateException e) {
			System.out.println("saveFile IllegalStateException error");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("saveFile IOException error");
			e.printStackTrace();
		}
	    return destination.getAbsolutePath();
	}// end of saveFile

	
	// 마지막 업로드 아이디 물어옴 
	@Override
	public int getLastUploadId() {
	    return sqlSession.selectOne("HomeworkDao.getLastUploadId");
	}// end of getLastUploadId
       
}// end of HomeworkDaoImpl
