package com.dal.dalgona.working.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;

public interface MswDao {
	
	List<Product> selectProduct(SqlSessionTemplate session );
	
//	List<Product> cartList(SqlSessionTemplate session,String memberId );
//	int sumMoney(SqlSessionTemplate session,String memberId );
	
	List<Product> cartList(SqlSessionTemplate session);
	
	List<Product> zzimList(SqlSessionTemplate session );

	
	List<Product> orderList(SqlSessionTemplate session );
}
