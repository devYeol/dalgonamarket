package com.dal.dalgona.payment.controller;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;

public interface PaymentDao {
	
	// 주문 정보 입력
	void order(ProductOrder productOrder);
	
	// 주문 상세정보 입력
	void orderDetail(OrderDetail[] detail, Member memberId);

}
