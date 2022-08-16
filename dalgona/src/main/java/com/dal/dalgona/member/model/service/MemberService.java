package com.dal.dalgona.member.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Likes;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;

public interface MemberService {

	List<Cart> cartList(Member m); 
	
	void cartInsert (Cart c);

//	void delete(int cartCode); //선택삭제

	long delete(long cartCode);
	
	void deleteAll(Member memberId); //전체 삭제
	
	int sumMoney(Member m); //총 금액 

	List<Likes> zzimList(Member memberId);

	List<Product> orderList();

	
	
	
	
	
	
	
	
	
	
	
	/* 충열 */
	
	Member login(Member m);
	
	int insertMember(Member m);
	
	int idCheck(String memberId);
	
	String authSendEmail(String senderEmail, String receiver);
	
	Member findId(String memberEmail) throws Exception;
	
	int findIdCheck(String memberEmail) throws Exception;
	
	int findPwCheck(Member m) throws Exception;
	
	String findPw(String senderEmail, String receiver);
	
	void findPwChange(Member m, String newPw);
	
	int infoUpdate(Member m) throws Exception;

	void deleteMember(String memberId);
	
	Member pwck(Member m);
	
	int pwUpdateCheck(Member m);
	
	int pwUpdateEnd(String memberId, String memberPwd1);
}
