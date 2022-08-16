package com.dal.dalgona.payment.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.ProductOrder;

public interface PaymentService {
	
	public String order(Cart cartList, ProductOrder productOrder, HttpSession session);
		
	// 아임포트 API + SECRET KEY = TOKEN
	String getToken() throws IOException;
	
	int productOrder(String imp_uid, String access_token) throws IOException;
	
	// 결제취소
	public void payMentCancle(String access_token, String imp_uid, String amount, String reason);
	
	// 장바구니 금액 == DB금액 일치 확인
	long orderPriceCheck(Cart cartList);

}
