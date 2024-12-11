package com.javaclass.teamAcademy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.teamAcademy.service.LogService;
import com.javaclass.teamAcademy.service.ProfileService;
import com.javaclass.teamAcademy.vo.LogVO;
import com.javaclass.teamAcademy.vo.ProfileVO;

@Controller
public class AcademyController {

	@Autowired
	private LogService logService;
	
	@Autowired
	private ProfileService profileService;

//	@RequestMapping("home.do")
//	public void home() {
//
//	} // end of home()

	
	@RequestMapping("comm_{view}.do")
	public String returnView(@PathVariable String view) {
		System.out.println("comm컨트롤러 진입");
		return "common/comm_" + view;
	} // end of returnView

	@RequestMapping("userInsert.do")
	public String userInsert(LogVO logvo, ProfileVO profilevo) {
		System.out.println("회원가입 처리 ===> 동시에 프로필");
		
		// 회원 가입 
		logService.userInsert(logvo);
		
		// logvo에서 생성된 user_No를 프로필로
		int userNo = logvo.getUser_No();
		profilevo.setUser_No(userNo);
		// 프로필 데이터 생성
		profileService.createProfile(profilevo);
		
		// 프로필 테이블까지 생성하면 로그인 페이지로
		return "common/comm_loginform";
		
	} // end of userInsert

	@RequestMapping("userLogin.do")
	public String userLogin(LogVO vo, HttpSession session) {
		
		System.out.println("vo:" + vo.toString());
	    
		LogVO result = logService.userLogin(vo);
	    
		System.out.println("result:" + result);
	    
		if ( result == null || result.getUser_Id() == null ){
	    	return "common/comm_loginform";
	    }else {
	    	session.setAttribute("login", vo.getUser_Id());
	    	
	    	return "common/comm_loginResult";
	    }
	       
	} // end of userLogin
	
	@RequestMapping("findId.do")
	public String findId(String user_Name, String user_Email, Model m)throws Exception{
		
		int checkResult = logService.findIdCheck(user_Name, user_Email);
		
		if(checkResult == 0) {
			
			m.addAttribute("msg", "이름과 이메일을 확인해주세요");
			
			return "common/comm_findId";
		
		}else{
			
			String foundId = logService.findUserId(user_Name, user_Email);
			
			m.addAttribute("user_Id", foundId);
			
			return "common/comm_findIdResult";
		}
		
	}
		
} // end of academyController
