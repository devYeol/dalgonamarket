package com.dal.dalgona.working.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Product> selectProduct(){
		return dao.selectProduct(session);
	}

//	@Override
//	public List<Product> cartList(String memberId){
//		return dao.cartList(session,memberId);
//	}
//
//	@Override
//	public int sumMoney(String memberId){
//		return dao.sumMoney(session,memberId);
//	}
	
	@Override
	public List<Product> cartList(){
		return dao.cartList(session);
	}
	
	@Override
	public List<Product> zzimList(){
		return dao.zzimList(session);
	}

	
	@Override
	public List<Product> orderList(){
		return dao.orderList(session);
	}
}
