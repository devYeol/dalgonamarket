package com.dal.dalgona.working.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.working.model.vo.Msw;


@Repository
public class MswDaoImpl implements MswDao{

	@Override
	public List<Msw> cartList(SqlSessionTemplate session){
		return session.selectList("msw.cartList");
	}
	
	@Override
	public List<Msw> zzimList(SqlSessionTemplate session){
		return session.selectList("msw.zzimList");
	}

	@Override
	public List<Msw> orderList(SqlSessionTemplate session){
		return session.selectList("msw.orderList");
	}
	
	
}
