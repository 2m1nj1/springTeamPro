package com.javaclass.teamAcademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SysCourseController {

	
	
	@PostMapping("courseCateList")
	@ResponseBody
	public String selectCourseCateList() {
		
		
		return null;
	} // end of selectCourseCateList();
} // end of SysCourseController
