package com.javaclass.teamAcademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class academyController {

	@RequestMapping("home.do")
	public void home() { 
	
	} //end of home()
	
	@RequestMapping("comm_{view}.do")
	public String returnView(@PathVariable String view) {
		
		return "common/comm_" + view;
	} // end of returnView
	
} // end of academyController
