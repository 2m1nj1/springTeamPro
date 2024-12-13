package com.javaclass.teamAcademy.aop;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
		
		String methodName = point.getSignature().getName();
		String classPath = point.getSignature().getDeclaringTypeName();
		String className = classPath.substring(classPath.lastIndexOf('.')+1);
		
		
		//세션 받아오기
		HttpSession currSession = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest().getSession();

		// 세션의 로그인 id
		String loginId = (String)(currSession.getAttribute("login"));
		
		// 세션의 분류
		Integer loginUserCate = (Integer) currSession.getAttribute("loginUserCate");
		
		// isEmpty() : 문자열의 길이가 0인 경우에, true를 리턴
		// isBlank() : 문자열이 비어 있거나, 빈 공백으로만 이루어져 있으면, true를 리턴
		
		// 세션에 로그인 id가 없으면 로그인 창 띄우기
		if(loginId == null || loginId.isBlank()) {
			System.out.println(">> 로그인 세션 없음!!!");
			
			// 요청명 가져오기
			ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
			HttpServletRequest request = attributes.getRequest();
	        String requestURI = request.getRequestURI();
			// System.out.println(">> " + requestURI);
			
			// 로그인/회원가입/아이디찾기/비밀번호찾기 요청은 세션 없어도 진행 가능
			List<String> allowedUris = Arrays.asList(
					"/userLogin.do", "/comm_register.do", "/comm_findId.do", "/comm_findPass.do", "/userInsert.do"
					,"/sendPassword.do", "verifyCode.do");

			if (allowedUris.contains(requestURI)) {
			    return point.proceed();
			} // end of if
			
			return "redirect:/index.jsp"; // 로그인 페이지 return
		} // end of if
		
		try {
			// 관리자 요청이지만, 관리자 계정이 아닌 경우
			if(className.startsWith("Sys") && !(loginUserCate == 3)) {
				return "redirect:/404.jsp";
			} // end of if
		} catch(Exception e) {
			System.err.println(e.getMessage());
		} // end of try_catch
		
		
		// 진행 중인 곳으로 돌아감
		return point.proceed();
	} // end of sessionCheck()

	
	
} // end of Login_chk
