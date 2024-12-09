package com.javaclass.teamAcademy.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.javaclass.teamAcademy.service.HomeService;
import com.javaclass.teamAcademy.vo.UserVO;

@Controller
public class HomeController {

	@Autowired
	private HomeService homeService;
	
	@GetMapping("home.do")
    public String home(HttpSession session, Model model) {
		
//        Object chkSystem = session.getAttribute("user");
//        
//        if (chkSystem != null) {
//            model.addAttribute("chkSystem", true);
//            //model.addAttrib   ute("userName", ((User) user).getName());
//        } else {
//            model.addAttribute("chkSystem", false);
//        } // end of if
		
		// 로그인 한 user의 id
		Object chkLoginUser = session.getAttribute("login");
		
		// 로그인 여부 확인
		if(chkLoginUser != null) { // 로그인 세션이 있다면	
			// session id 로 user의 정보 가져오기
			UserVO userInfo = homeService.selectUser((String)chkLoginUser);
			
			session.setAttribute("loginUserPK", userInfo.getUser_no());			// 회원 번호 (PK)
			session.setAttribute("loginUserCate", userInfo.getUser_cate_no());	// 회원 분류번호 (FK)
			session.setAttribute("loginUserName", userInfo.getUser_name());		// 회원 이름
			
			// 관리자 계정 로그인 시, 관리자 홈 화면 
			if(userInfo.getUser_cate_no() == 3) { return "system/sys_home"; }
		} // end of if
		
		// 로그인 세션이 없다면
		return "home";
    } // end of home()
	
} // end of HomeController
