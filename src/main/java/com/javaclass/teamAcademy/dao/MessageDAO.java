package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.MessageVO;

public interface MessageDAO {
	public void insertMessage(MessageVO vo);
	
	public void deleteMessage(MessageVO vo);
	
	public MessageVO getMessage(MessageVO vo);
	
	public List<MessageVO> getMessageList(int user_no);
	
	public List<MessageVO> reciveMessageList(int user_no);	
	
	public List<MessageVO> sendMessageList(int user_no);
}