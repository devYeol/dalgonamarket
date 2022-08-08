package com.dal.dalgona.working.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.working.model.dao.MswDao;
import com.dal.dalgona.working.model.vo.Msw;

@Service
public class MswServiceImpl implements MswService {

	@Autowired
	private MswDao dao;
	@Autowired
	private SqlSessionTemplate session;
	

	@Override
	public List<Msw> cartList(){
		return dao.cartList(session);
	}
	
	@Override
	public List<Msw> zzimList(){
		return dao.zzimList(session);
	}

	@Override
	public List<Msw> orderList(){
		return dao.orderList(session);
	}
	
}
