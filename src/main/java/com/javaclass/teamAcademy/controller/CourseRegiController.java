package com.javaclass.teamAcademy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.CourseRegiService;
import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.UserVO;

@Controller
public class CourseRegiController {

	@Autowired
	private CourseRegiService courseRegiService;
	
	// ----------------------------------
	// 		   	  뷰 페이지 이동
	// ----------------------------------
	@GetMapping("courseRegi")
	public String courseRegi(Model m) {
		
		// 학년 리스트 불러오기
		m.addAttribute("courseConGrade", courseRegiService.selectCourseCateGrade());
		
		return "system/courseRegi";
	} // end of courseRegi()
	
	// ----------------------------------
	// 		 분류 선택 시, 하위 분류 불러오기
	// ----------------------------------
	@PostMapping("selectCourseCateDownList")
	@ResponseBody
	public List<CourseCateVO> selectCourseCateDownList(String selected){
		return courseRegiService.selectCourseCateDownList(selected);
	} // end of selectAreaList()
	
	// ----------------------------------
	// 			선택한 분류에 포함된
	//        강좌를 담당하는 강사 불러오기
	// ----------------------------------
	@PostMapping("selectConTch")
	@ResponseBody
	public List<UserVO> selectConTchList(String selected){
		return courseRegiService.selectConTchList(selected);
	} // end of selectConTchList()
	
	
	// ----------------------------------
	//			선택한 조건에 해당하는
	//			 강좌 목록 불러오기
	// ----------------------------------
	@PostMapping("selectConCourseList")
	@ResponseBody
	public List<CourseVO> selectConCourseList(@RequestParam(required = false) String selected
			, @RequestParam(required = false, value="checked[]") List<String> checked){
		
		System.out.println(">> 컨트롤러 도달!! : " + selected);
		System.out.println(">> " + checked);
		List<CourseVO> courseInfoList = courseRegiService.selectConCourseList(selected, checked);
		
		// 강좌 일정
		List<CourseVO> allCourseSch = new ArrayList<>();
		
		for(CourseVO courseVO : courseInfoList) {
			List<CourseVO> courseSch = courseRegiService.selectConCourseSch(courseVO.getCourse_no());
			allCourseSch.addAll(courseSch);
		} // end of for
		
		return null;
	} // end of selectConCourseList()
	
	
	
} // end of CourseRegiController
