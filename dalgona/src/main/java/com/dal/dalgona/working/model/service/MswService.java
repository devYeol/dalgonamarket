package com.dal.dalgona.working.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;

public interface MswService {

	
//	List<Product> selectProduct();
	Member login(Member m);
	List<Cart> cartList(Member m); 
//
	int sumMoney(Member m); //총 금액 
//	
////	List<Product> cartList();
//
//	List<Product> zzimList();
//	
//	List<Product> orderList();
	
}
