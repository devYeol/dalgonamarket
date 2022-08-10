package com.dal.dalgona.working.model.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;

public interface MswDao {
	
	
//	List<Product> selectProduct(SqlSessionTemplate session );
	
	List<Cart> cartList(SqlSessionTemplate session,Member m );
	
	void delete(SqlSessionTemplate session,long productCode);
	
	int sumMoney(SqlSessionTemplate session,Member m );


//	List<Product> zzimList(SqlSessionTemplate session );

//	List<Product> orderList(SqlSessionTemplate session );

	
	
	
	
	
	
	
	
	
	
}
