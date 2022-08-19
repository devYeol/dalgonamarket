package com.dal.dalgona.working.model.service;

import java.util.List;
import java.util.Map;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;

public interface PjeService {
	List<Member> searchMembers(Map<String,Object> param);
	int searchMembersCount(Map<String,Object> param);
	List<OrderDetail> selectOrderDetails();
	List<OrderDetail> selectOrderDetailsCode(long orderCode);
	int minusProductAmount(Map<String,Object> param);
	
}
