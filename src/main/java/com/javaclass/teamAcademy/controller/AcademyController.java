package com.javaclass.teamAcademy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String returnView(@PathVariable String view, @RequestParam(value = "user_No", required = false) String userNo, HttpSession session) {
	    System.out.println("comm컨트롤러 진입");

	    // user_No가 파라미터로 넘어왔다면
	    if (userNo != null) {
	        // 파라미터에서 user_No를 처리
	        System.out.println("user_No 파라미터로 받아옴: " + userNo);
	    }
	    // 세션에서 user_No를 가져온다면
	    else if (session.getAttribute("user_No") != null) {
	        // 세션에서 user_No를 처리
	    	Integer user_No = (Integer) session.getAttribute("user_No");
	    	String userNoString = String.valueOf(user_No);
	        System.out.println("user_No 세션에서 받아옴: " + user_No);
	    }

	    // "comm_{view}" 형태로 반환되며, view 값에 따라 동적으로 화면을 처리
	    return "common/comm_" + view;  // 예시: comm_{view}.jsp로 이동
	}

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
	    	
	    	return "redirect:home.do";
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
	
	@RequestMapping("changePass.do")
	public String changePass(String user_Email, String user_Pass, Model m)throws Exception{
		
		System.out.println(user_Email);
		System.out.println(user_Pass);
		
		int result = logService.changePass(user_Email, user_Pass);
		
		System.out.println(result);
		
		if(result == 0) {
			m.addAttribute("msg", "비밃번호 변경에 실패했습니다.");
			return "common/comm_findPassResult";
			
		}else {
			
			m.addAttribute("msg", "비밃번호가 변경되었습니다.");
			return "common/comm_loginform";
		}
	}
		
} // end of academyController
