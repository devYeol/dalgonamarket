package com.dal.dalgona.working.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Cart;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.dao.MswDao;

@Service
public class MswServiceImpl implements MswService {

	@Autowired
	private MswDao dao;
	@Autowired
	private SqlSessionTemplate session;
	
	
	@Override
	public Member login(Member m) {
		return dao.login(session, m);
	}
	
//	@Override
//	public List<Product> selectProduct(){
//		return dao.selectProduct(session);
//	}

	@Override
	public List<Cart> cartList(Member m){
		return dao.cartList(session,m);
	}

	@Override
	public int sumMoney(Member m){
		return dao.sumMoney(session,m);
	}
	
//	@Override
//	public List<Product> cartList(){
//		return dao.cartList(session);
//	}
	
//	@Override
//	public List<Product> zzimList(){
//		return dao.zzimList(session);
//	}
//
//	
//	@Override
//	public List<Product> orderList(){
//		return dao.orderList(session);
//	}
}
