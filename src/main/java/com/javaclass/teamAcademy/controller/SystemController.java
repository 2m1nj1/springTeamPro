package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SystemService;
import com.javaclass.teamAcademy.vo.ClassroomVO;

@Controller
public class SystemController {
	
	@Autowired
	private SystemService systemService;
	
	@RequestMapping("sys_{view}.do")
	public String returnView(@PathVariable String view) {
		
		return "system/sys_" + view;
	} // end of returnView
	
	
	// ---------------------------------
	// 		   	강의실 목록 검색
	// ---------------------------------
	@GetMapping("classroomList")
	@ResponseBody
	public List<ClassroomVO> SelectClassroomList(ClassroomVO vo) {
		System.out.println(vo.toString());
		List<ClassroomVO> result = systemService.SelectClassroomList(vo);
		return result;
	} // end of SelectClassroomList()
	
} // end of systemController
