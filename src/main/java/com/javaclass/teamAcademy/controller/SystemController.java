package com.javaclass.teamAcademy.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SysCourseService;
import com.javaclass.teamAcademy.service.SystemService;
import com.javaclass.teamAcademy.vo.ClassroomVO;
import com.javaclass.teamAcademy.vo.CourseStaVO;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.EmailDomainVO;

@Controller
public class SystemController {
	
	@Autowired
	private SystemService systemService;
	
	@Autowired
	private SysCourseService sysCourseService;
	
	@GetMapping("sys_{view}.do")
	public String returnView(@PathVariable String view, Model m) {
		
		// 이메일 도메인(selector) 불러올 view
		Set<String> emailDomainListView = Set.of("stuInsert", "stuDetail");
		
		if(emailDomainListView.contains(view)) {
			List<EmailDomainVO> emailDomainList = systemService.selectEmailDomainList(); 
			m.addAttribute("emailDomainList", emailDomainList);
		} // end of if
		
		// 강좌 상태(selector) 불러올 view
		Set<String> courseStaListView = Set.of("courseInsert");
		if(courseStaListView.contains(view)) {
			List<CourseStaVO> courseStaList = systemService.selectCourseStaList();
			m.addAttribute("courseStaList", courseStaList);
		} // end of if
		
		// 강좌 view
		if(view.equals("course")) {
			try {
				// 상태 별 강좌 수
				List<CourseStaVO> courseStaList = systemService.selectCourseStaList(); 
				for(CourseStaVO courseStaVO : courseStaList) {
					int rsCount = systemService.countCourse(courseStaVO.getCourse_status_name());					
					m.addAttribute("count_" + courseStaVO.getCourse_status_eng(), rsCount);
				} // end of for
				
				
				// 강좌 리스트
				List<CourseVO> courseList = sysCourseService.selectCourseList();
				m.addAttribute("courseList", courseList);
			} catch (Exception e) {
		        System.err.println(">> Error occurred: " + e.getMessage());
		        e.printStackTrace();
		    } // end of try_catch
		} // end of if
		
		return "system/sys_" + view;
	} // end of returnView
	
	
	// ---------------------------------
	// 		   	강의실 목록 검색
	// ---------------------------------
	@GetMapping("classroomList")
	@ResponseBody
	public List<ClassroomVO> selectClassroomList(ClassroomVO vo) {
		return systemService.selectClassroomList(vo);
	} // end of selectClassroomList()
	
	
	// ---------------------------------
	// 		   	  강의실 상세
	// ---------------------------------
	@GetMapping("classroomDetail")
	@ResponseBody
	public ClassroomVO selectClassroomDetail(ClassroomVO vo) {
		return systemService.selectClassroomDetail(vo);
	} // end of selectClassroomDetail()
	
	
	// ---------------------------------
	// 		   	  강의실 수정
	// ---------------------------------
	@PostMapping("updateClassroom")
	@ResponseBody
	public String updateClassroom (ClassroomVO vo) {
		systemService.updateClassroom(vo);
		return null;
	} // end of updateClassroom()
	
	
	// ---------------------------------
	// 		   	  강의실 삭제
	// ---------------------------------
	@PostMapping("deleteClassroom")
	@ResponseBody
	public String deleteClassroom (ClassroomVO vo) {
		systemService.deleteClassroom(vo);
		return null;
	} // end of deleteClassroom()
	
	
	// ---------------------------------
	// 		   	  강의실 등록
	// ---------------------------------
	@PostMapping("insertClassroom")
	@ResponseBody
	public String insertClassroom(ClassroomVO vo) {
		systemService.insertClassroom(vo);
		return null;
	} // end of insertClassroom()
	
} // end of systemController
