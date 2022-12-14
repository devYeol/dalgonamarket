package com.dal.dalgona.working.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;

public interface PjeDao {
	List<Member> searchMembers(SqlSessionTemplate session, Map<String,Object> param);
	int searchMembersCount(SqlSessionTemplate session, Map<String,Object> param);
	List<OrderDetail> selectOrderDetails(SqlSessionTemplate session);
	List<OrderDetail> selectOrderDetailsCode(SqlSessionTemplate session, long orderCode);
	int minusProductAmount(SqlSessionTemplate session, Map<String,Object> param);
}
