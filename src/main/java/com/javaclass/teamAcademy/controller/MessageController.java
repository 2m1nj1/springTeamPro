package com.javaclass.teamAcademy.controller;
 
 import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.javaclass.teamAcademy.service.MessageService;
import  com.javaclass.teamAcademy.vo.MessageVO;
 
 
 @Controller
 public class MessageController {
 
	 	
	 	@Autowired
		private MessageService messageService;
	 	
	 	int user_no = 5; // 향후 로그인 한 사람의 user_no
	 	
	  	//메세지 목록 조회
		@GetMapping("comm_getMessageList.do")
		public String getMessageList(Model m) {
			//HttpSession session  << Model m 옆에 붙을 내용
			 // String userId = (String)session.getAttribute("xxxx");
			 //String userId = "28";
		//	System.out.println("==========> getMessageList.do");
		
			
	 		
			//받는 목록
			List<MessageVO> reciveMessageList = messageService.reciveMessageList();
			m.addAttribute("reciveMessageList", reciveMessageList);
			
			//보내는 목록
			List<MessageVO> sendMessageList = messageService.sendMessageList();
			m.addAttribute("sendMessageList", sendMessageList);
			
			System.out.println("Receive Message: " + reciveMessageList);
			System.out.println("Send Message: " + sendMessageList);

			return "common/comm_getMessageList";  
		}
		
		// 메세지 작성
		@RequestMapping("comm_insertMessage.do")
		public String insertMessage(MessageVO vo) {
			//System.out.println("[comm_insertMessage]" + vo.toString());
			//messageService.insertMessage(vo);
			return "common/comm_insertMessage";
		}
		

		//메세지 저장 후 목록 보기
		@RequestMapping("saveMessage.do")
		public String saveMessage(@ModelAttribute MessageVO vo, Model m) {
			vo.setMsg_sender(user_no);						// 가상의 세션값을 설정함.
			System.out.println("입력값 확인: " + vo.toString());
			messageService.insertMessage(vo);
			// 목록보기 페이지 지정
			return "redirect:comm_getMessageList.do";
		}

		@RequestMapping("comm_getMessage.do")
		public String getMessage(MessageVO vo, Model m) { 
			MessageVO result = messageService.getMessage(vo);
			m.addAttribute("message", result);
			return "common/comm_getMessage";
		}

		
		 @RequestMapping("comm_deleteMessage.do") 
		 public String deleteMessage(MessageVO vo) {
			 System.out.println("[comm_deleteMessage]" + vo.toString());
			 messageService.deleteMessage(vo);
			 
		 return "redirect:comm_getMessageList.do"; 
		}
		 
		 
		
 }

