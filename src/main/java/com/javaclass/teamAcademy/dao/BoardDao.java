package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.BoardVO;

public interface BoardDao {
	
	public List<BoardVO> getBoardList();
	
	public BoardVO getBoard(BoardVO vo);
	
	public void insertBoard(BoardVO vo);
	
	public void updateBoard(BoardVO vo);
	
	public void deleteBoard(BoardVO vo);
}
