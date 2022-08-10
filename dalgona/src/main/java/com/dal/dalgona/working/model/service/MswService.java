package com.dal.dalgona.working.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;

public interface MswService {

	
	
	List<Cart> cartList(Member m); 

	int sumMoney(Member m); //총 금액 

//	List<Product> zzimList();

//	List<Product> orderList();

	
	
}
