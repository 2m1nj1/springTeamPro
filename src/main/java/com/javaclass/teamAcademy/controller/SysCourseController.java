package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.SysCourseService;
import com.javaclass.teamAcademy.vo.CourseCateVO;

@Controller
public class SysCourseController {

	
	@Autowired
	SysCourseService sysCourseService;
	
	@PostMapping("courseCateList")
	@ResponseBody
	public List<CourseCateVO> selectCourseCateList() {
		return sysCourseService.selectCourseCateList();
	} // end of selectCourseCateList();
} // end of SysCourseController
