package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SysTchService;
import com.javaclass.teamAcademy.service.SystemService;
import com.javaclass.teamAcademy.vo.EmailDomainVO;
import com.javaclass.teamAcademy.vo.UserVO;

@Controller 
public class SysTchController {
	
	@Autowired
	private SystemService systemService;
	
	@Autowired
	private SysTchService sysTchService;
	
	
	// ----------------------------------
	//        		강사 수
	// ----------------------------------
	// 전체 강사 수
	@GetMapping("tchAllCount")
	@ResponseBody
	public int selectTchAllCount() {
		int result = sysTchService.selectTchAllCount();
		return result;
	} // end of selectTchAllCount()
	
	// 수강 중인 수강생 수
	@GetMapping("tchRegiCount")
	@ResponseBody
	public int selectStuRegiCount() {
		return sysTchService.selectTchRegiCount();
	} // end of selectStuRegiCount()
	
	// 이번 달 탈퇴 수강생
	@GetMapping("tchSecCount")
	@ResponseBody
	public int selectStuSecCount() {
		return sysTchService.selectTchSecCount();
	} // end of selectStuSecCount()
	

	// ----------------------------------
	// 			강사 목록 불러오기
	// ----------------------------------
	@GetMapping("tchList")
	@ResponseBody
	public List<UserVO> selectTchList(UserVO vo){
		return sysTchService.selectTchList(vo);
	} // end of selectTchList()
	
	@PostMapping("showAllTch")
	@ResponseBody
	public List<UserVO> selectTchAll(UserVO vo){
		return sysTchService.selectTchList(vo);
	} // end of selectTchAll();
	
	@PostMapping("showRegiTch")
	@ResponseBody
	public List<UserVO> selectTchRegi(){
		return sysTchService.selectTchRegi();
	} // end of selectTchRegi()
	
	@PostMapping("showNotRegiTch")
	@ResponseBody
	public List<UserVO> showNotRegiTch(){
		return sysTchService.selectTchNotRegi();
	} // end of showNotRegiTch()
	
	@PostMapping("showSecTch")
	@ResponseBody
	public List<UserVO> showSecTch(){
		return sysTchService.selectTchSec();
	} // end of showSecTch()
	
	
	
	// ----------------------------------
	// 		    강사 상세 페이지 이동
	// ----------------------------------
	@GetMapping("tchDetail.do")
	public String selectTchDetail(UserVO vo, Model m) {
		
		// 이메일 불러오기
		List<EmailDomainVO> emailDomainList = systemService.selectEmailDomainList();
		m.addAttribute("emailDomainList", emailDomainList);
		
		// 강사 정보 불러오기
		UserVO resultVO = sysTchService.selectTchDetail(vo);
		m.addAttribute("teacher", resultVO);
		
		return "system/sys_tchDetail";
	} // end of selectTchDetail

	
	// ----------------------------------
	// 			강사 정보 수정
	// ----------------------------------
	@PostMapping("tchDetailUpdate.do")
	public String updateTchDetail(UserVO vo) {
		sysTchService.updateTchDetail(vo);
		
		return "redirect:tchDetail.do?user_no=" + vo.getUser_no();
	} // end of updateTchDetail()
	
	
	// ----------------------------------
	// 			   수강생 삭제
	// ----------------------------------
	@GetMapping("tchDelete.do")
	public String deleteTch(UserVO vo) {
		sysTchService.deleteTch(vo);
		
		return "system/sys_teacher";
	} // end of deleteTch()

	
	// ----------------------------------
	// 			   수강생 등록
	// ----------------------------------
	@PostMapping("tchInsert.do")
	public String insertTch(UserVO vo) {
		sysTchService.insertTch(vo);
		
		return "system/sys_teacher";
	} // end of insertTch()
	
} // end of ListController
