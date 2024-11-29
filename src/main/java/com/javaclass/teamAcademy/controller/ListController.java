package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.javaclass.teamAcademy.service.ListService;
import com.javaclass.teamAcademy.vo.UserVO;

// return 값이 view Page 지정이 아닌, 전송될 data
@RestController 
public class ListController {

	@Autowired
	private ListService listService;
	
	// 수강생 목록 불러오기
	@GetMapping("stuList")
	public List<UserVO> selectStuList(){
		List<UserVO> result = listService.selectStuList();
		
		return result;
	} // end of selectStuList()
	
} // end of ListController
