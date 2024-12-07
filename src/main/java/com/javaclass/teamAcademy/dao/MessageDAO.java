package com.javaclass.teamAcademy.dao;

import java.util.List;

import com.javaclass.teamAcademy.vo.MessageVO;

public interface MessageDAO {
	public void insertMessage(MessageVO vo);
	
	public void deleteMessage(MessageVO vo);
	
	public MessageVO getMessage(MessageVO vo);
	
	public List<MessageVO> getMessageList();
	
	public List<MessageVO> reciveMessageList();	
	
	public List<MessageVO> sendMessageList();
}