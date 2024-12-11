package com.javaclass.teamAcademy.aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class LoginChk {
	
	@Around("execution(* com.javaclass.teamAcademy.controller.*.*(..))")
    public Object sessionCheck(ProceedingJoinPoint point) throws Throwable  {
		
		//세션 받아오기
		HttpSession currSession = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		
		// 세션의 로그인 id
		String loginId = (String)(currSession.getAttribute("login"));
		
		// isEmpty() : 문자열의 길이가 0인 경우에, true를 리턴
		// isBlank() : 문자열이 비어 있거나, 빈 공백으로만 이루어져 있으면, true를 리턴
		
		// 세션에 로그인 id가 없으면 로그인 창 뜨우기
		if(loginId == null || loginId.isBlank()) {
			System.out.println(">> 로그인 세션 없음!!!");
			
			//return "redirect:/index.jsp";
		} // end of if
		
		// 진행 중인 곳으로 돌아감
		return point.proceed();
	} // end of sessionCheck()
	
} // end of Login_chk
