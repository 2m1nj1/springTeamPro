package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.CourseRegiService;
import com.javaclass.teamAcademy.service.SysStuService;
import com.javaclass.teamAcademy.service.SystemService;
import com.javaclass.teamAcademy.vo.CourseVO;
import com.javaclass.teamAcademy.vo.EmailDomainVO;
import com.javaclass.teamAcademy.vo.UserVO;

@Controller 
public class SysStuController {

	@Autowired
	private SystemService systemService;
	
	@Autowired
	private SysStuService sysStuService;
	
	@Autowired
	private CourseRegiService courseRegiService;
	
	// ----------------------------------
	//        	    수강생 수
	// ----------------------------------
	// 전체 수강생 수
	@GetMapping("stuAllCount")
	@ResponseBody
	public int selectStuAllCount() {
		return sysStuService.selectStuAllCount();
	} // end of selectStuCount()
	
	// 수강 중인 수강생 수
	@GetMapping("stuRegiCount")
	@ResponseBody
	public int selectStuRegiCount() {
		return sysStuService.selectStuRegiCount();
	} // end of selectStuRegiCount()
	
	// 이번 달 탈퇴 수강생
	@GetMapping("stuSecCount")
	@ResponseBody
	public int selectStuSecCount() {
		return sysStuService.selectStuSecCount();
	} // end of selectStuSecCount()
	
	// 수강생 목록 불러오기
	@GetMapping("stuList")
	@ResponseBody
	public List<UserVO> selectStuList(){
		return sysStuService.selectStuList();
	} // end of selectStuList()
	
	@PostMapping("showAllStu")
	@ResponseBody
	public List<UserVO> selectStuAll(){
		return sysStuService.selectStuList();
	} // end of selectStuAll();
	
	@PostMapping("showRegiStu")
	@ResponseBody
	public List<UserVO> selectStuRegi(){
		return sysStuService.selectStuRegi();
	} // end of selectStuRegi()
	
	@PostMapping("showNotRegiStu")
	@ResponseBody
	public List<UserVO> showNotRegiStu(){
		return sysStuService.selectStuNotRegi();
	} // end of selectStuNotRegi()
	
	@PostMapping("showSecStu")
	@ResponseBody
	public List<UserVO> showSecStu(){
		return sysStuService.selectStuSec();
	} // end of selectStuSec()
	
	
	// ----------------------------------
	//        	   수강생 상세
	// ----------------------------------
	// 수강생 상세 페이지 이동
	@GetMapping("stuDetail.do")
	public String selectStuDetail(UserVO vo, Model m) {
		// 이메일 불러오기
		List<EmailDomainVO> emailDomainList = systemService.selectEmailDomainList();
		m.addAttribute("emailDomainList", emailDomainList);
		
		// 수강생 정보 불러오기
		UserVO userVO = sysStuService.selectStuDetail(vo);
		m.addAttribute("student", userVO);
		
		// 수강생이 수강하는 강좌 정보 불러오기
		List<CourseVO> courseInfoList = sysStuService.selectStuDetailCourse(vo);
		for(CourseVO courseVO : courseInfoList) {
			List<String> courseSch = courseRegiService.selectConCourseSch(courseVO.getCourse_no());
			courseVO.setCourse_sch_list(courseSch);
		}
		m.addAttribute("courseInfoList", courseInfoList);
		
		return "system/sys_stuDetail";
	} // end of selectStuDetail
	
	@PostMapping("stuDetailCourseCancel")
	@ResponseBody
	public List<CourseVO> stuDetailCourseCancel(@RequestParam String stuUserNo
			,@RequestParam String cancelCourse){
		
		List<CourseVO> courseInfoList = sysStuService.stuDetailCourseCancel(stuUserNo, cancelCourse);
		for(CourseVO courseVO : courseInfoList) {
			List<String> courseSch = courseRegiService.selectConCourseSch(courseVO.getCourse_no());
			courseVO.setCourse_sch_list(courseSch);
		}
		return courseInfoList;
	} // end of stuDetailCourseCancel()
	
	
	
	// 수강생 정보 수정
	@PostMapping("stuDetailUpdate.do")
	public String updateStuDetail(UserVO vo) {
		sysStuService.updateStuDetail(vo);
		
		return "redirect:stuDetail.do?user_no=" + vo.getUser_no();
	} // end of updateStuDetail()
	
	
	// 수강생 삭제
	@GetMapping("stuDelete.do")
	public String deleteStu(UserVO vo) {
		sysStuService.deleteStu(vo);
		
		return "system/sys_student";
	} // end of deleteStu
	

	// 수강생 등록
	@PostMapping("stuInsert.do")
	public String insertStu(UserVO vo) {
		System.out.println(">> " + vo.toString());
		sysStuService.insertStu(vo);
		
		return "system/sys_student";
	} // end of insertStu()
		
} // end of ListController
