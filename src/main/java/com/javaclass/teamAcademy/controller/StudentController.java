package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.teamAcademy.service.HomeworkService;
import com.javaclass.teamAcademy.vo.HomeworkVO;

@Controller("/student")
public class StudentController {

	@Autowired
    private HomeworkService homeworkService;
	
	@RequestMapping("stu_{view}.do")
	public String returnView(@PathVariable String view) {

		return "student/stu_" + view;
	} // end of returnView
	
	// 데이터 물어오는 라우팅(루팅, routing) - [학생] 과제제출 페이지랑 연결.
    @RequestMapping("/homeworkList")
    public String getHomeworkList(Model m, HomeworkVO vo) {
        // Fetch homework data using the service
        List<HomeworkVO> homeworkList = homeworkService.getHomeworkList(vo);
        m.addAttribute("homeworkList", homeworkList);
        return "student/stu_homework"; // Renders student/stu_homework.jsp
    }
	
} // end of studentController

