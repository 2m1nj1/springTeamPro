package com.javaclass.teamAcademy.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("com.javassem")
// "com.javassem" 패키지 안의 것들을 통으로 봐달라는 이야기.
public class ProjectException {

	@ExceptionHandler() //구체적인 예외 Class 써주면 됨. 이 경우 모든 exception class 쓴다. 이름 중복되면 기능 못 함.
	public String handlerException(Exception e, Model m) {
		
		m.addAttribute("exception", e); //모델에다가 exception 을 던져줄것인데, 그것은 "exception" 이란 이름으로 갈 것이고
		
		return "error/TransErrorPage"; // 여기로 갈 거시에오..
	}
}
