package com.dal.dalgona.working.model.service;

import java.util.List;

import com.dal.dalgona.common.model.vo.Product;

public interface MswService {

	
	List<Product> selectProduct();
	
//	List<Product> cartList(Member m);
	List<Product> cartList();

	List<Product> zzimList();
	
	List<Product> orderList();
}
