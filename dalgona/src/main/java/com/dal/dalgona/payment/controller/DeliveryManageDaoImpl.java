package com.dal.dalgona.payment.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;

@Repository
public class DeliveryManageDaoImpl implements DeliveryManageDao {
	
	@Override
	public DeliveryLocation selectDl(SqlSessionTemplate session,Member memberId){
		
		return session.selectOne("order.selectDl", memberId);
		
	}

}
