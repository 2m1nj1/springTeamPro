package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.BoardVO;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao{
	@Autowired
	private SqlSessionTemplate mybatis;	

	@Override
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis insertBoard() 호출");
		System.out.println(vo.getBoard_title() + "/" + vo.getBoard_cate());
		mybatis.insert("BoardDAO.insertBoard", vo);	
	}

	@Override
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis updateBoard() 호출");
		mybatis.update("BoardDAO.updateBoard", vo);	
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis deleteBoard() 호출");
		mybatis.delete("BoardDAO.deleteBoard", vo);	
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis getBoard() 호출");
		return (BoardVO) mybatis.selectOne("BoardDAO.getBoard", vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> Mybatis getBoardList() 호출");
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
}
