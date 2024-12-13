package com.javaclass.teamAcademy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.teamAcademy.service.TchHomeworkService;
import com.javaclass.teamAcademy.vo.TchHomeworkVO;


@Controller
public class HomeworkController {

	
	@Autowired
	private TchHomeworkService tchHomeworkService;
	

	
	// 과제 작성
	@RequestMapping("tch_insertHomework.do")
	public String insertHomework(TchHomeworkVO vo,HttpSession session) {
		// 로그인 한 user의 id
	 	System.out.println("[tch_insertHomework]" + vo.toString());
		
		tchHomeworkService.insertHomework(vo);
		return "teacher/tch_homeworkList";
	}
	
	
//	// 과제 목록 
//	@GetMapping("tch_homeworkList.do")
//	public String homeworkList(Model m) {
//		//HttpSession session  << Model m 옆에 붙을 내용
//		 // String userId = (String)session.getAttribute("xxxx");
//		 //String userId = "28";
//	//	System.out.println("==========> getMessageList.do");
	
	//과제 목록 조회
	@GetMapping("tch_homeworkList.do")
	public String homeworkList(Model m, HttpSession session) {	
		int user_no = (int)session.getAttribute("loginUserPK");	
		
		List<TchHomeworkVO> homeworkList = tchHomeworkService.homeworkList(user_no);
		
		m.addAttribute("homeworkList", homeworkList);
		System.out.println("homeworkList: " + homeworkList);
		
		return "teacher/tch_homeworkList";  
	}
	
	
//	// 과제 상세
//	@RequestMapping("homework.do")
//	public String homework(TchHomeworkVO vo, Model m) { 
//		TchHomeworkVO result = tchHomeworkService.homework(vo);
//		m.addAttribute("message", result);
//		return "redirect:tch_homeworkList";
//	}
	
	// 과제 삭제
//	@RequestMapping("comm_deleteMessage.do") 
//	 public String deleteMessage(MessageVO vo) {
//		 System.out.println("[comm_deleteMessage]" + vo.toString());
//		 messageService.deleteMessage(vo);
//		 
//	 return "redirect:comm_getMessageList.do"; 
//	}
	
	
}
