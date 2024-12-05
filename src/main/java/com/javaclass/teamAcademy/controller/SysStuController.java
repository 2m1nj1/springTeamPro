package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SysStuService;
import com.javaclass.teamAcademy.vo.UserVO;

@Controller 
public class SysStuController {

	@Autowired
	private SysStuService sysStuService;
	
	
	// 전체 수강생 수
	@GetMapping("stuAllCount")
	@ResponseBody
	public int selectStuAllCount() {
		return sysStuService.selectStuAllCount();
	} // end of selectStuCount()
	
	
	// 수강생 목록 불러오기
	@GetMapping("stuList")
	@ResponseBody
	public List<UserVO> selectStuList(){
		return sysStuService.selectStuList();
	} // end of selectStuList()
	
	// 수강생 상세 페이지 이동
	@GetMapping("stuDetail.do")
	public String selectStuDetail(UserVO vo, Model m) {
		UserVO resultVO = sysStuService.selectStuDetail(vo);
		m.addAttribute("student", resultVO);
		
		return "system/sys_stuDetail";
	} // end of selectStuDetail
	
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
