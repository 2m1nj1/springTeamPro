package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.BoardDao;
import com.javaclass.teamAcademy.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDAO;
	
	@Override
	public List<BoardVO> getBoardList() {
		
		return boardDAO.getBoardList();
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		
		return boardDAO.getBoard(vo);
	}

	@Override
	public void insertBoard(BoardVO vo) {
		
		boardDAO.insertBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO updateBoard(BoardVO vo) {
		
		boardDAO.updateBoard(vo);
		return vo;
	}

}
