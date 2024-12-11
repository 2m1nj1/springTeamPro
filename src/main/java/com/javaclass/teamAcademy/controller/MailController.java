package com.javaclass.teamAcademy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaclass.teamAcademy.service.LogService;
import com.javaclass.teamAcademy.service.MailService;
import com.javaclass.teamAcademy.vo.LogVO;

@Controller
public class MailController {

	@Autowired
	MailService mailService;
	
	@Autowired
	LogService logService;
	
	@RequestMapping("sendPassword.do")
	public String sendPassword(String user_Email, HttpSession session,  Model m) {
	
		System.out.println("### " + user_Email);
						
		try {
			
			LogVO user = logService.getUserByEmail(user_Email);
			
			if (user != null) {
				// 인증번호 전송
				String user_AuthKey = mailService.sendSimpleMessage(user);
				session.setAttribute("authKey", user_AuthKey);
				session.setAttribute("user_Email", user_Email); // 사용자 이메일 세션에 저장
	            session.setAttribute("user_No", user.getUser_No()); // 사용자 번호 세션에 저장
	            
	            m.addAttribute("msg", "인증번호가 이메일로 전송되었습니다.");
            
			} else {
				
				return "redirect:comm_findPass.do";
			
			}
			
		} catch (Exception e) {			
			e.printStackTrace();
			m.addAttribute("msg", "비밀번호 찾기 중 오류가 발생했습니다.");
	        return "redirect:comm_findPass.do";
		}
		
		return "redirect:comm_findPass.do"; 
	}
	
	@RequestMapping("verifyCode.do")
	@ResponseBody
	public String vergyCode(@RequestParam String inputPassCode, HttpSession session) {
		String storedAuthKey = (String) session.getAttribute("authKey");
		
		if (storedAuthKey != null && storedAuthKey.equals(inputPassCode)) {
	        // 인증번호 일치
	        return "success";
	    } else {
	        // 인증번호 불일치
	        return "fail";
	    }
	}
}
