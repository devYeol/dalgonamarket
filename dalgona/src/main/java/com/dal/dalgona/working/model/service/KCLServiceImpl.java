package com.dal.dalgona.working.model.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.dao.KCLDao;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class KCLServiceImpl implements KCLService {

	@Autowired
	private JavaMailSender mailSender;
		
	@Autowired
	private KCLDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Member login(Member m) {
		return dao.login(session, m);
	}

	@Override
	public int insertMember(Member m) {
		return dao.insertMember(session,m);
	}
	
	@Override
	public int idCheck(String memberId) {
		return dao.idCheck(session,memberId);
	}
	
	@Override 
	public String authSendEmail(String senderEmail,String receiverEmail) {
		
		MimeMessage mimeMsg=mailSender.createMimeMessage(); 
		MimeMessageHelper msg=new MimeMessageHelper(mimeMsg,"utf-8"); 
		
		Random random=new Random();
		String key="";
		
		int numIndex=random.nextInt(888888)+111111;
		key+=numIndex;
		
		try { 
		msg.setFrom(senderEmail);
		msg.setTo(receiverEmail); 
		msg.setSubject("달고나 인증번호 발송"); 
		msg.setText("달고나 인증번호 "+key); 
		}catch (MessagingException e) { 
			e.printStackTrace(); 
		}
		mailSender.send(mimeMsg); 
		return key;
	}
}
