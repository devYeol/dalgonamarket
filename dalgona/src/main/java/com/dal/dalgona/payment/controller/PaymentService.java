//package com.dal.dalgona.payment.controller;
//
//import java.io.IOException;
//
//import com.dal.dalgona.common.model.vo.Cart;
//
//public interface PaymentService {
//		
//	// 아임포트 API + SECRET KEY = TOKEN
//	String getToken() throws IOException;
//	
//	int paymentInfo(String imp_uid, String access_token);
//	
//	// 장바구니 금액, DB금액 일치 확인
//	long orderPriceCheck(Cart cart);
//	
//	// 결제취소
//	public void payMentCancle(String access_token, String imp_uid, String amount, String reason);
//
//}
