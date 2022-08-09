package com.dal.dalgona.working.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;


@Repository
public class MswDaoImpl implements MswDao{

	@Override
	public List<Product> selectProduct(SqlSessionTemplate session){
		return session.selectList("msw.selectProduct");
	}

	@Override
	public List<Product> cartList(SqlSessionTemplate session){
		return session.selectOne("msw.cartList");
	}
//	@Override
//	public List<Product> cartList(SqlSessionTemplate session,Member m){
//		return session.selectOne("msw.cartList",m);
//	}
	
	@Override
	public List<Product> zzimList(SqlSessionTemplate session){
		return session.selectList("msw.zzimList");
	}

	@Override
	public List<Product> orderList(SqlSessionTemplate session){
		return session.selectList("msw.orderList");
	}
	
	
}
