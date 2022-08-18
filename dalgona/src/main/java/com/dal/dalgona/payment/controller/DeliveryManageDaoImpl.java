package com.dal.dalgona.payment.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;

@Repository
public class DeliveryManageDaoImpl implements DeliveryManageDao {
	
	@Override
	public DeliveryLocation selectDl(SqlSessionTemplate session,Member memberId){
		
		return session.selectOne("order.selectDl", memberId);
		
	}
	
	@Override
	public int insertOd(SqlSessionTemplate session, OrderDetail od) {
		
		return session.insert("order.order", od);
		
	}
	
	@Override
	public int insertPo(SqlSessionTemplate session, ProductOrder po) {
		
		return session.insert("order.pOrder", po);
		
	}

}
