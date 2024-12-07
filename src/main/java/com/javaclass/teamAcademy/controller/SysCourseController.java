package com.javaclass.teamAcademy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SysCourseService;
import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseSchVO;
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
	public int insertCourse(CourseVO vo) {
		sysCourseService.insertCourse(vo);
		return vo.getCourse_no();
	} // end of insertCourse()
	
	// 강좌 일정 등록
	@PostMapping("insertSchList")
	@ResponseBody
	public String insertSchList(@RequestBody  ArrayList<CourseSchVO> courseSchList) {
		System.out.println(">> 컨트롤러 제대로 도착함!!!");
		System.out.println(">> " + courseSchList);
		return null;
	} // end of insertSchList()
	
	// 교육 과정 등록
	@PostMapping("insertLectureList")
	@ResponseBody
	public String insertLectureList(LectureVOList lectureVOList) {
		System.out.println(lectureVOList);
		
		String course_no = lectureVOList.getList().get(0).getCourse_no();
		
		for(LectureVO lectureVO : lectureVOList.getList()) {
			lectureVO.setCourse_no(course_no);
			sysCourseService.insertLectureList(lectureVO);
		} // end of for
		return null;
	} /// end of insertLectureList()
	
} // end of SysCourseController
