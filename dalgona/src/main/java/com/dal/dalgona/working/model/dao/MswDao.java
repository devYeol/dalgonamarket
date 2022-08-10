package com.dal.dalgona.working.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;

public interface MswDao {
	Member login(SqlSessionTemplate session, Member m);
//	List<Product> selectProduct(SqlSessionTemplate session );
	
	List<Cart> cartList(SqlSessionTemplate session,Member m );
	
	int sumMoney(SqlSessionTemplate session,Member m );
//	
////	List<Product> cartList(SqlSessionTemplate session);
//	
//	List<Product> zzimList(SqlSessionTemplate session );
//
//	
//	List<Product> orderList(SqlSessionTemplate session );
}
