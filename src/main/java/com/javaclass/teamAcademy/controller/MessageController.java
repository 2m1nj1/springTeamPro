package com.javaclass.teamAcademy.controller;
 
 import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import com.javaclass.teamAcademy.service.MessageService;
import  com.javaclass.teamAcademy.vo.MessageVO;
import com.javaclass.teamAcademy.vo.UserVO;
 
 
 @Controller
 public class MessageController {
	 		
	 		
	 	
	 	@Autowired
		private MessageService messageService;
	 	
	 	// 로그인 한 user의 id
	 	//Object chkLoginUser = session.getAttribute("login");
	 	
	  	//메세지 목록 조회
		@GetMapping("comm_getMessageList.do")
		public String getMessageList(HttpSession session, Model m) {
		
			// 로그인 한 user의 id
		 	int user_no = (int)session.getAttribute("loginUserPK");
			
		 	

	 		
			//받는 목록
			List<MessageVO> reciveMessageList = messageService.reciveMessageList(user_no);
			m.addAttribute("reciveMessageList", reciveMessageList);
			
			//보내는 목록
			List<MessageVO> sendMessageList = messageService.sendMessageList(user_no);
			m.addAttribute("sendMessageList", sendMessageList);
			
//			System.out.println("Receive Message: " 	+ reciveMessageList);
//			System.out.println("Send Message: " 	+ sendMessageList);

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
		public String saveMessage(@ModelAttribute MessageVO vo, HttpSession session) {
            vo.setMsg_sender((Integer) session.getAttribute("loginUserPK"));
		//	System.out.println("입력값 확인: " + vo.toString());
			try {
				messageService.insertMessage(vo);
				
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
			
			// 목록보기 페이지 지정
			return "redirect:comm_getMessageList.do";
		}

		@RequestMapping("comm_getMessage.do")
		public String getMessage(MessageVO vo, Model m) { 
			MessageVO result = messageService.getMessage(vo);
			m.addAttribute("message", result);
			return "common/comm_getMessage";
		}// end of getMessage

		
		 @RequestMapping("comm_deleteMessage.do") 
		 public String deleteMessage(MessageVO vo) {
		//	 System.out.println("[comm_deleteMessage]" + vo.toString());
			 messageService.deleteMessage(vo);
			 
		 return "redirect:comm_getMessageList.do"; 
		}// end of deleteMessage
		 
		 
		
 }// end of MessageController

