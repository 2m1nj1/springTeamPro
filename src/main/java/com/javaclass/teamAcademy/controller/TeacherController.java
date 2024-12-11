package com.javaclass.teamAcademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TeacherController {

	@RequestMapping("tch_{view}.do")
	public String returnView(@PathVariable String view) {
		
		return "teacher/tch_" + view;
	} // end of returnView

}
