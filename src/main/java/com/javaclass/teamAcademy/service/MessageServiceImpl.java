package com.javaclass.teamAcademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.dao.MessageDAO;
import com.javaclass.teamAcademy.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService {

		@Autowired
		private MessageDAO messageDAO;
		
		public void insertMessage(MessageVO vo) {
			messageDAO.insertMessage(vo);
		}

		public void deleteMessage(MessageVO vo) {
			messageDAO.deleteMessage(vo);
		}

		public MessageVO getMessage(MessageVO vo) { 	// 글(쪽지) 하나 가져오기
			return messageDAO.getMessage(vo);
		}

		public List<MessageVO> getMessageList() {
			return messageDAO.getMessageList();
		}
		
		public List<MessageVO> reciveMessageList() { 		// 받은 쪽지 목록 불러오기
			return messageDAO.reciveMessageList();
		} 
		
		public List<MessageVO> sendMessageList() { 		// 보내는 쪽지 목록 불러오기
			return messageDAO.sendMessageList();
		}
		
}
