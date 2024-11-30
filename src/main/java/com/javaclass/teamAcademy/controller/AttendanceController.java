package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.AttendanceService;
import com.javaclass.teamAcademy.vo.AttendanceVO;

@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	// 특정 강좌에 대한 출석부 목록 출력...
	@GetMapping("/getAttendanceList")
	@ResponseBody
	public String getAttendanceList(
	        @RequestParam("user_no") int user_no,
	        @RequestParam("course_no") int course_no,
	        Model m) {

	    AttendanceVO vo = new AttendanceVO();
	    vo.setUser_no(user_no);
	    vo.setCourse_no(course_no);

	    List<AttendanceVO> attendanceList = attendanceService.getAttendanceList(vo);
	    m.addAttribute("attendanceList", attendanceList);

	    return "stu_attendance"; // stu_attendance.jsp 로 재설정.
	}

	// 특정 강좌에 대한 출석부 내 출석정보(Attendance no pk값으로) 열람
	@GetMapping("/getAttendancedetail")
	public String getAttendanceDetail(
			@RequestParam("attendance_date") String attendance_date,
			@RequestParam("user_no") int user_no,
			Model m
			) {
		AttendanceVO vo = new AttendanceVO();
		vo.setAttendance_date(attendance_date);
		vo.setUser_no(user_no);
		
		AttendanceVO attendanceDetail = attendanceService.getAttendanceDetail(vo);
		m.addAttribute("attendanceDetail", attendanceDetail);
		
		return "stu_attendance_detail"; //출석정보 detail 표시하는 곳으로 return.
	}
}
