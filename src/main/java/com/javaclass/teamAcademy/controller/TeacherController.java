package com.javaclass.teamAcademy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.TchAttendanceService;
import com.javaclass.teamAcademy.vo.TchAttendanceVO;

@Controller
public class TeacherController {

		
		@Autowired
		private TchAttendanceService tchAttendanceService;
		
		int user_no = 4;	// 향후 로그인 한 사람의 user_no
		
		@RequestMapping("tch_{view}.do")
		public String returnView(@PathVariable String view) {
			
			return "teacher/tch_" + view;
		} // end of returnView
		
		// 학생 목록 조회
		@RequestMapping("tch_attendance")
		public String attendance(Model m) {
			
			List<TchAttendanceVO> tchAttendance = tchAttendanceService.tchAttendance();
			m.addAttribute("tchAttendance", tchAttendance);
			
			System.out.println("tchAttendance list: " + tchAttendance);
			
			return "teacher/tch_attendance";
		}
		
//		@GetMapping("/getAttendanceData")
//		@ResponseBody
//		public Map<String, Integer> getAttendanceData(@RequestParam String courseName) {
//		    // 출결 정보를 가져오는 로직
//			
//			int attended = tchAttendanceService.getAttendanceCount(courseName, "출석");
//			int left 	 = tchAttendanceService.getAttendanceCount(courseName, "조퇴"); 
//			int absent   = tchAttendanceService.getAttendanceCount(courseName, "결석");
//			
//		    Map<String, Integer> response = new HashMap<>();
//		    response.put("attended", attended);
//		    response.put("left", left);
//		    response.put("absent", absent);
//		    return response;
//		}
		
			
}
