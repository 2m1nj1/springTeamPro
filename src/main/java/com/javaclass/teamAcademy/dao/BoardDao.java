package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.BoardVO;

public interface BoardDao {
	public void insertBoard(BoardVO vo);
	
	public void updateBoard(BoardVO vo);
	
	public void deleteBoard(BoardVO vo);
	
	public BoardVO getBoard(BoardVO vo);
	
	public List<BoardVO> getBoardList(BoardVO vo);
}
