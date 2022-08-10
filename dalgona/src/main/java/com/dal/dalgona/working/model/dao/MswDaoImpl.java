package com.dal.dalgona.working.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Product;


@Repository
public class MswDaoImpl implements MswDao{

	@Override
	public List<Product> selectProduct(SqlSessionTemplate session){
		return session.selectList("cart.selectProduct");
	}

	@Override
	public List<Product> cartList(SqlSessionTemplate session){
		return session.selectList("cart.cartList");
	}
	
//	@Override
//	public List<Product> cartList(SqlSessionTemplate session,String memberId){
//		return session.selectList("cart.cartList",memberId);
//	}
	
//	@Override
//	public int sumMoney(SqlSessionTemplate session,String memberId){
//		
//		session.selectOne("cart.cartList",memberId);
//		return session.selectOne("cart.sumMoney",memberId);
//	}
	@Override
	public List<Product> zzimList(SqlSessionTemplate session){
		return session.selectList("cart.zzimList");
	}

	@Override
	public List<Product> orderList(SqlSessionTemplate session){
		return session.selectList("cart.orderList");
	}
	
	
}
