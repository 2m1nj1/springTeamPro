package com.javaclass.teamAcademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SystemController {
	
	@RequestMapping("sys_{view}.do")
	public String returnView(@PathVariable String view) {
		
		return "system/sys_" + view;
	} // end of returnView
	
	
} // end of systemController
