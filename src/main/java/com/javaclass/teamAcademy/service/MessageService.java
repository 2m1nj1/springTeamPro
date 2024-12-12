package com.javaclass.teamAcademy.service;

import java.util.List;

import com.javaclass.teamAcademy.vo.MessageVO;

public interface MessageService {

	// 쪽지 보내기
	void insertMessage(MessageVO vo);

	// 쪽지 삭제
	void deleteMessage(MessageVO vo);

	// 쪽지 상세 조회
	MessageVO getMessage(MessageVO vo);

	// 메세지 저장 후 확인
	List<MessageVO> getMessageList(int user_no);

	// 받은 메세지 목록 조회
	List<MessageVO> reciveMessageList(int user_no);

	// 보낸 메세지 목록 조회
	List<MessageVO> sendMessageList(int user_no);

}
