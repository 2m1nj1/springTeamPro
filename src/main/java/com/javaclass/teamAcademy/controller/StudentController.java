package com.javaclass.teamAcademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("/student")
public class StudentController {

	@RequestMapping("stu_{view}.do")
	public String returnView(@PathVariable String view) {

		return "student/stu_" + view;
	} // end of returnView
	
} // end of studentController
