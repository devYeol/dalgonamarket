package com.dal.dalgona.payment.controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	
	@Autowired
	private SqlSession sql;
	
	@Override
	public void order(ProductOrder productOrder) {
		
		sql.insert("order.order", productOrder);
		
	}
 
	@Override
	public void orderDetail(OrderDetail[] detail, Member memberId) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberId", memberId);
		map.put("detail", detail);
		
		sql.insert("order.orderDetail", map);
		
	}

}
