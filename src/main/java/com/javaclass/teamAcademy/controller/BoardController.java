package com.javaclass.teamAcademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.javaclass.teamAcademy.service.BoardService;
import com.javaclass.teamAcademy.vo.BoardVO;

@Controller

public class BoardController {

	@Autowired
	private BoardService boardService;

	@RequestMapping("board_getBoardList.do")
	public String getBoardList(Model m) {
		List<BoardVO> list = boardService.getBoardList();
		
		m.addAttribute("boardList", list);

		return "board/board_getBoardList";
	}

	@PostMapping("saveBoard.do")
	public String saveBoard(BoardVO vo) {
		System.out.println("saveBoard 컨트롤러진입");
		System.out.println("입력값: " + vo.toString());
		boardService.insertBoard(vo);

		return "redirect:board_getBoardList.do";
	}

	@RequestMapping("board_getBoard.do")
	public String getBoard(BoardVO vo, Model m) {
		BoardVO result = boardService.getBoard(vo);
		m.addAttribute("board", result);

		return "board/board_getBoard";
	}

	@RequestMapping("deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);

		return "redirect:board_getBoardList.do";

	}

	@RequestMapping("board_updateBoard.do")
	public String updateBoard(BoardVO vo, Model m) {
	    System.out.println("updateBoard 컨트롤러 진입");
	    BoardVO result = boardService.getBoard(vo);
	    m.addAttribute("board", result);
	    return "board/board_updateBoard";
	}
	
	@RequestMapping("updateBoard.do")
	public String updateBoard(BoardVO vo) {
		boardService.updateBoard(vo);

		return "redirect:board_getBoardList.do?board_No= " + vo.getBoard_No();
	}

	
	@RequestMapping("board_{view}.do") 
	public String returnView(@PathVariable String view) {
		System.out.println("board컨트롤러 진입");
		
		return "board/board_" + view;
	}

}
