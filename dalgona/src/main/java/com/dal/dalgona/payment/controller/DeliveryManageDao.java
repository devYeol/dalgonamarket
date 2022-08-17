package com.dal.dalgona.payment.controller;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.DeliveryLocation;
import com.dal.dalgona.common.model.vo.Member;

public interface DeliveryManageDao {
	
	DeliveryLocation selectDl(SqlSessionTemplate session, Member memberId);

}
