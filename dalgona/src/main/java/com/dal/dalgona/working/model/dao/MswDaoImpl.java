package com.dal.dalgona.working.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;


@Repository
public class MswDaoImpl implements MswDao{

	
//	@Override
//	public List<Product> selectProduct(SqlSessionTemplate session){
//		return session.selectList("cart.selectProduct");
//	}
	
	@Override
	public List<Cart> cartList(SqlSessionTemplate session,Member m){
		return session.selectList("cart.cartList",m);
	}
	
	@Override
	public int sumMoney(SqlSessionTemplate session,Member m){
		return session.selectOne("cart.sumMoney",m);
	}
	
	@Override
	public long delete(SqlSessionTemplate session,long productCode) {
		return session.delete("cart.deletecart",productCode);
	}

//	@Override
//	public List<Product> zzimList(SqlSessionTemplate session){
//		return session.selectList("cart.zzimList");
//	}
//
//	@Override
//	public List<Product> orderList(SqlSessionTemplate session){
//		return session.selectList("cart.orderList");
//	}
	
	
	
	
	
}
