package com.dal.dalgona.payment.controller;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.ProductOrder;

public interface DeliveryManageService {
	
	DeliveryLocation selectDl(Member memberId);
	
	int insertOd(OrderDetail od);
	
	int insertPo(ProductOrder po);

}
