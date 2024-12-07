package com.javaclass.teamAcademy.vo;

import lombok.Data;

@Data
public class MessageVO {
			
		private Integer msg_no;				// 쪽지번호
		private Integer msg_sender;			// 회원번호(발신인)
		private Integer msg_reciver;		// 회원번호(수신인)
		private String  msg_title;			// 제목
		private String  msg_context;		// 내용
		private String  msg_date;			// 보낸일시
		private String 	sender_name;		// 발신인 이름 (보내는 사람)
		private String 	reciver_name;		// 수신인 이름	(받는 사람)
		private String  user_no;			// 회원번호
		private String  user_name;			// 회원이름
}
