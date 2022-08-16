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
import com.dal.dalgona.common.model.vo.Likes;
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
	
	@Override
	public void cartInsert(Cart c){
		dao.cartInsert(session,c);
	}

	@Override
	public List<Cart> cartList(Member m){
		return dao.cartList(session,m);
	}
	@Override
	public List<Likes> zzimList(Member memberId){
		return dao.zzimList(session,memberId);
	}
	@Override
	public long delete(long cartCode) {
		return dao.delete(session,cartCode);
	}
	
	@Override
	public List<Product> orderList(){
		return dao.orderList(session);
	}
	
//	@Override
//	public void delete(int cartCode) { 
//		 dao.delete(session,cartCode);
//	}

	public void deleteAll(Member memberId) { 
		dao.deleteAll(session,memberId);
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
	public Member findId(String memberEmail) throws Exception {
		return dao.findId(session,memberEmail);
	}
	
	@Override
	public int findIdCheck(String memberEmail) throws Exception {
		return dao.findIdCheck(session,memberEmail);
	}
	
	@Override
	public int findPwCheck(Member m) throws Exception {
		return dao.findPwCheck(session,m);
	}
	
	@Override
	public String findPw(String senderEmail,String receiverEmail) {
		
		MimeMessage mimeMsg=mailSender.createMimeMessage(); 
		MimeMessageHelper msg=new MimeMessageHelper(mimeMsg,"utf-8"); 
		
		Random random=new Random();
		String key="";
		
		int numIndex=random.nextInt(88888888)+11111111;
		key+=numIndex;
		
		try { 
		msg.setFrom(senderEmail);
		msg.setTo(receiverEmail); 
		msg.setSubject("달고나 임시비밀번호 발송"); 
		msg.setText("달고나마켓 [임시비밀번호] : "+key); 
		}catch (MessagingException e) { 
			e.printStackTrace(); 
		}
		mailSender.send(mimeMsg);
		
		log.debug(key);
		
		return key;
	}
	
	@Override
	public void findPwChange(Member m, String newPw) {
		
		System.out.println(m.getMemberEmail());
		System.out.println(m.getMemberId());
		System.out.println(newPw);
		
		dao.findPwChange(session,m,newPw);
	}
	
	@Override
	public int infoUpdate(Member m) throws Exception {
		
		return dao.infoUpdate(session, m);
	}
	
	@Override
	public void deleteMember(String memberId) {
		
		dao.deleteMember(session,memberId);
	}
	
	@Override
	public Member pwck(Member m) {
		
		return dao.pwck(session, m);
	}
	
	@Override
	public int pwUpdateCheck(Member m) {
		
		return dao.pwUpdateCheck(session, m);
	}
	
	@Override
	public int pwUpdateEnd(String memberId, String memberPwd1) {
		
		return dao.pwUpdateEnd(session,memberId,memberPwd1);
	}

}
