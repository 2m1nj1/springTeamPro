package com.javaclass.teamAcademy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SysCourseService;
import com.javaclass.teamAcademy.service.SystemService;
import com.javaclass.teamAcademy.vo.CourseCateVO;
import com.javaclass.teamAcademy.vo.CourseSchVO;
import com.javaclass.teamAcademy.vo.CourseStaVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.LectureVO;
import com.javaclass.teamAcademy.vo.LectureVOList;

@Controller
public class SysCourseController {

	@Autowired
	private SysCourseService sysCourseService;
	
	@Autowired
	private SystemService systemService;
	
	// 강좌 분류 목록 불러오기 (JsTree)
	@PostMapping("courseCateList")
	@ResponseBody
	public List<CourseCateVO> selectCourseCateList() {
		return sysCourseService.selectCourseCateList();
	} // end of selectCourseCateList();
	
	// ---------------------------------
	//			   강좌 등록
	// ---------------------------------
	// 강좌 정보 등록
	@PostMapping("insertCourse")
	@ResponseBody
	public int insertCourse(CourseVO vo) {
		sysCourseService.insertCourse(vo);
		return vo.getCourse_no();
	} // end of insertCourse()
	
	// 강좌 일정 등록
	@PostMapping("insertCourseSchList")
	@ResponseBody
	public int insertSchList(@RequestBody  ArrayList<CourseSchVO> courseSchList) {
		try {
	        for (CourseSchVO courseSchVO : courseSchList) {
	            sysCourseService.insertSchList(courseSchVO);
	        } // end of for
	    } catch (Exception e) {
	        System.err.println(">> Error occurred: " + e.getMessage());
	        e.printStackTrace();
	    } // end of try_catch
		
		return 1;
	} // end of insertSchList()
	
	// 교육 과정 등록
	@PostMapping("insertLectureList")
	@ResponseBody
	public int insertLectureList(LectureVOList lectureVOList) {
		// 강좌 번호
		String course_no = lectureVOList.getList().get(0).getCourse_no();
		
		for(LectureVO lectureVO : lectureVOList.getList()) {
			lectureVO.setCourse_no(course_no);
			sysCourseService.insertLectureList(lectureVO);
		} // end of for
		
		return 1;
	} /// end of insertLectureList()
	
	
	// ---------------------------------
	//			   강좌 상세
	// ---------------------------------
	@GetMapping("courseDetail")
	public String selectCourseDetail(CourseVO vo, Model m) {
		// 강좌 분류
		List<CourseStaVO> courseStaList = systemService.selectCourseStaList();
		m.addAttribute("courseStaList", courseStaList);
		
		// 강좌 정보 
		m.addAttribute("courseInfo", sysCourseService.selectCourseInfo(vo));
		m.addAttribute("courseLec", sysCourseService.selectCourseLec(vo));
		return "system/sys_courseDetail";
	} // end of selectCourseDetail()
	
	// 강좌 일정
	@PostMapping("selectCourseSch")
	@ResponseBody
	public List<CourseSchVO> selectCourseSch(@RequestParam String course_no) {
		CourseVO vo = new CourseVO();
		vo.setCourse_no(Integer.parseInt(course_no));
		return sysCourseService.selectCourseSch(vo);
	} // end of selectCourseSch()
	
} // end of SysCourseController
