package com.dal.dalgona.payment.controller;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;

public interface DeliveryManageDao {
	
	DeliveryLocation selectDl(SqlSessionTemplate session, Member memberId);

	int insertOd(SqlSessionTemplate session, OrderDetail od);
	
	int insertPo(SqlSessionTemplate session, ProductOrder po);

}
