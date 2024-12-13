package com.javaclass.teamAcademy.service;

import java.util.List;
import java.util.Map;

import com.javaclass.teamAcademy.vo.BoardVO;

public interface BoardService {
	// 글 목록 조회
	List<BoardVO> getBoardList();	
	// 글 상세 조회
	BoardVO getBoard(BoardVO vo);	
	// 글 등록
	void insertBoard(BoardVO vo);	
	// 글 삭제
	void deleteBoard(BoardVO vo);
	// 글 수정
	BoardVO updateBoard(BoardVO vo);

	// 조회수 증가
	void updateBoardCnt(Integer board_No);

}
