package com.dal.dalgona.payment.controller;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class DeliveryManageServiceImpl implements DeliveryManageService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private DeliveryManageDao dao;
	
	@Override
	public DeliveryLocation selectDl(Member memberId){
		return dao.selectDl(session, memberId);
	}
	
	@Override
	public int insertOd(OrderDetail od) {
		return dao.insertOd(session, od);
	}
	
	@Override
	public int insertPo(ProductOrder po) {
		return dao.insertPo(session, po);
	}
	


}
