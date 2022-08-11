package com.dal.dalgona.member.model.service;

import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.member.model.dao.MemberDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MemberServiceImpl implements MemberService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
//	@Override
//	public List<Product> selectProduct(){
//		return dao.selectProduct(session);
//	}

	@Override
	public List<Cart> cartList(Member m){
		return dao.cartList(session,m);
	}
	@Override
	public List<Product> zzimList(){
		return dao.zzimList(session);
	}
	@Override
	public List<Product> orderList(){
		return dao.orderList(session);
	}
	
	@Override
	public void delete(long productCode) {
		 dao.delete(session,productCode);
	}
	
	@Override
	public int sumMoney(Member m){
		return dao.sumMoney(session,m);
	}

	
	/* 충열 */
	
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
		msg.setText("달고나마켓 [인증번호] : "+key); 
		}catch (MessagingException e) { 
			e.printStackTrace(); 
		}
		mailSender.send(mimeMsg);
		
		log.debug(key);
		
		return key;
	}
	
	@Override
	public Member findId(String memberEmail)throws Exception {
		return dao.findId(session,memberEmail);
	}
	
	@Override
	public int findIdCheck(String memberEmail)throws Exception {
		return dao.findIdCheck(session,memberEmail);
	}
	
	@Override
	public int findPwCheck(Member m)throws Exception {
		return dao.findPwCheck(session,m);
	}
	
	@Override
	public void findPw(String memberEmail,String memberId)throws Exception {
		
		MimeMessage mimeMsg=mailSender.createMimeMessage(); 
		MimeMessageHelper msg=new MimeMessageHelper(mimeMsg,"utf-8"); 
		
		Random random=new Random();
		String key="";
		int numIndex=random.nextInt(88888888)+11111111;
		key+=numIndex;
		
		
	}
}
