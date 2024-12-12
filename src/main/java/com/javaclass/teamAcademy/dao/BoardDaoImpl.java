package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.BoardVO;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public List<BoardVO> getBoardList() {
		System.out.println("Mybatis getBoardList() 호출");
		List<BoardVO> result = mybatis.selectList("BoardDAO.getBoardList");
		
		// DB로부터 받은 테이타를 확인
		for(BoardVO vo : result) {
			System.out.println(vo.toString());
		}
		return result;
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("=============================getBoard() 호출");
		BoardVO result = mybatis.selectOne("BoardDAO.getBoard", vo);
		System.out.println("=============================BoardDAO.getBoard 결과:" + result);
		return result;
	}

	@Override
	public void insertBoard(BoardVO vo) {
		System.out.println("Mybatis insertBoard() 호출");
		mybatis.insert("BoardDAO.insertBoard", vo);
		
	}

	@Override
	public void updateBoard(BoardVO vo) {
		System.out.println("Mybatis updateBoard() 호출");
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
	
		
		System.out.println("Mybatis deleteBoard() 호출");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}

	
}
