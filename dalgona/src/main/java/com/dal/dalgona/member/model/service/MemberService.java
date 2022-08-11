package com.dal.dalgona.member.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;

public interface MemberService {

	List<Cart> cartList(Member m); 

	void delete(long productCode);
	
	int sumMoney(Member m); //총 금액 

	List<Product> zzimList();

	List<Product> orderList();

	/* 충열 */
	
	Member login(Member m);
	
	int insertMember(Member m);
	
	int idCheck(String memberId);
	
	String authSendEmail(String senderEmail, String receiver);
	
	Member findId(String memberEmail)throws Exception;
	
	int findIdCheck(String memberEmail)throws Exception;
}
