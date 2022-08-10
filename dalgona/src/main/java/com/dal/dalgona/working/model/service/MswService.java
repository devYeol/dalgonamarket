package com.dal.dalgona.working.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Product;

public interface MswService {

	
	List<Product> selectProduct();
	
//	List<Product> cartList(String memberId); 
//
//	int sumMoney(String memberId); //총 금액 
	
	List<Product> cartList();

	List<Product> zzimList();
	List<Product> orderList();
	
}
