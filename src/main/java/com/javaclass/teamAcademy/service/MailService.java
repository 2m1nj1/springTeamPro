package com.javaclass.teamAcademy.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.javaclass.teamAcademy.vo.LogVO;

@Service
public class MailService {

	private final JavaMailSender javaMailSender;
	
	public MailService() {
		javaMailSender = javaMailService();
	}
	
	String sender = "sdg5349@naver.com";
	
	public String sendSimpleMessage(LogVO user) {
		
		String generatedString = user_AuthKey();
		String sendMessage = makeSendMessage(generatedString);
	
		System.out.println("Recipient Email: " + user.getUser_Email());
		
		try {
			MimeMessage message = javaMailSender.createMimeMessage();
			message.setFrom(sender);
			message.setSubject("[ 우리사이트 ] 인증번호 전송합니다22");		
			message.setText(sendMessage, "utf-8", "html");		
			
			message.addRecipients(MimeMessage.RecipientType.TO, user.getUser_Email());
		
			javaMailSender.send(message);
		}catch(Exception  ex) {
				System.out.println("메일전송실패:" + ex.getMessage());
		}
		
		return generatedString;
	}
	
	public String makeSendMessage(String keyValue) {
		
		StringBuffer msg = new StringBuffer();
		
		msg.append("인증번호입니다 <br/>");
		msg.append("<h1>"+ keyValue + "</h1>");
		msg.append("인증번호를 확인해 주세요");
		
		return msg.toString();
	}
		
		// 랜덤 인증 코드 전송
	public String user_AuthKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();
		
		for (int i = 0; i < 8; i++) { // 인증코드 8자리
			int index = rnd.nextInt(3); // 0~2 까지 랜덤, rnd 값에 따라서 아래 switch 문이 실행됨

			switch (index) {
				case 0:
					key.append((char) ((int) (rnd.nextInt(26)) + 97));
					// a~z (ex. 1+97=98 => (char)98 = 'b')
					break;
				case 1:
					key.append((char) ((int) (rnd.nextInt(26)) + 65));
					// A~Z
					break;
				case 2:
					key.append((rnd.nextInt(10)));
					// 0~9
					break;
			}
		}
		return key.toString();
	}
	
	public JavaMailSender javaMailService() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();

		javaMailSender.setHost("smtp.naver.com"); // 메인 도메인 서버 주소 => 정확히는 smtp 서버 주소
		javaMailSender.setUsername("sdg5349@naver.com"); // 네이버 아이디
		javaMailSender.setPassword("shin1023##"); // 네이버 비밀번호


		javaMailSender.setPort(465); // 메일 인증서버 포트

		javaMailSender.setJavaMailProperties(getMailProperties()); // 메일 인증서버 정보 가져오기

		return javaMailSender;
	}
	
	private Properties getMailProperties() {
		Properties properties = new Properties();
		properties.setProperty("mail.transport.protocol", "smtp"); // 프로토콜 설정
		properties.setProperty("mail.smtp.auth", "true"); // smtp 인증
		properties.setProperty("mail.smtp.starttls.enable", "true"); // smtp strattles 사용
		properties.setProperty("mail.debug", "true"); // 디버그 사용
		properties.setProperty("mail.smtp.ssl.trust","smtp.naver.com"); // ssl 인증 서버는 smtp.naver.com
		properties.setProperty("mail.smtp.ssl.enable","true"); // ssl 사용
		return properties;
	}
	
}
