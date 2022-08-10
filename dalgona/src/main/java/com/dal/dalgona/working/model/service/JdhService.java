package com.dal.dalgona.working.model.service;

import java.io.IOException;

import com.dal.dalgona.common.model.vo.Member;

public interface JdhService {
	
	// 결제
	String getToken() throws IOException;
	int paymentInfo(String imp_uid, String access_token) throws IOException;
	public void payMentCancle(String access_token, String imp_uid, String amount, String reason);
	
	// 주문
//	long orderPriceCheck(Cart Cart);
	
	
	
	// jpa 테스트
	public Member jdhInsertTest(Member m);
	
//	Member login(Member m);
//	
//	int insertMember(Member m);
	
}
