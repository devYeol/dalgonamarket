package com.dal.dalgona.payment.controller;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;

public interface DeliveryManageService {
	
	DeliveryLocation selectDl(Member memberId);

}
