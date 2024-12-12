package com.javaclass.teamAcademy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaclass.teamAcademy.vo.MessageVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMessage(MessageVO vo) {
		System.out.println("===> Mybatis insertMessage() 호출"+ vo.toString());
		mybatis.insert("MessageDAO.insertMessage", vo);
		System.out.println("[insertMessage] 결과: ");
	}
	
	
	public void deleteMessage(MessageVO vo) {
		System.out.println("===> Mybatis deleteMessage() 호출" + vo.toString());
		mybatis.delete("MessageDAO.deleteMessage", vo);
		System.out.println("[deleteMessage] 결과: ");
		}

	public MessageVO getMessage(MessageVO vo) {
		System.out.println("===> Mybatis getMessage() 호출 " + vo.toString() );
		MessageVO result = mybatis.selectOne("MessageDAO.getMessage", vo);
		System.out.println("[getMessage] 결과: "+ result);
		return result;
	}
	
	public List<MessageVO> getMessageList(int user_no) {
		System.out.println("===> Mybatis getMessageList() 호출");
		// 받는 목록
		List<MessageVO> result = mybatis.selectList("MessageDAO.getMessageList", user_no);
		return result;
	}

	public List<MessageVO> reciveMessageList(int user_no) {
		System.out.println("===> Mybatis reciveMessageList() 호출");
		// 받는 목록
		List<MessageVO> reciveResult = mybatis.selectList("MessageDAO.reciveMessageList", user_no);
		return reciveResult;
	}

	public List<MessageVO> sendMessageList(int user_no) {
		System.out.println("===> Mybatis sendMessageList() 호출");
		// 보내는 목록
		List<MessageVO> sendResult = mybatis.selectList("MessageDAO.sendMessageList", user_no);
		return sendResult;
	}
}
