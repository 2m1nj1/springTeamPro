package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SysCourseService;
import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.LectureVO;
import com.javaclass.teamAcademy.vo.LectureVOList;

@Controller
public class SysCourseController {

	@Autowired
	SysCourseService sysCourseService;
	
	// 강좌 분류 목록 불러오기 (JsTree)
	@PostMapping("courseCateList")
	@ResponseBody
	public List<CourseCateVO> selectCourseCateList() {
		return sysCourseService.selectCourseCateList();
	} // end of selectCourseCateList();
	
	// 강좌 등록
	@PostMapping("insertCourse")
	@ResponseBody
	public String insertCourse(CourseVO courseVO) {
		//System.out.println("컨트롤러 도착");
		//System.out.println(">> " + courseVO.toString());
		
		// 강좌 정보 등록
		sysCourseService.insertCourse(courseVO);
		
		return "ok";
	} // end of insertCourse()
	
	// 교육 과정 등록
	@PostMapping("insertLectureList")
	@ResponseBody
	public String insertLectureList(LectureVOList lectureVOList) {
		for(LectureVO lectureVO : lectureVOList.getList()) {
			lectureVO.setCourse_no("1"); // 이거 처리해야함
			System.out.println(">> " + lectureVO.toString());
			sysCourseService.insertLectureList(lectureVO);
		} // end of for
		
		return null;
	} /// end of insertLectureList()
	
} // end of SysCourseController
