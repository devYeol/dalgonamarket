package com.dal.dalgona.working.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.OrderDetail;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.common.model.vo.ProductOrder;

@Repository
public class PjeDaoImpl implements PjeDao {

	@Override
	public List<Member> searchMembers(SqlSessionTemplate session, Map<String,Object> param) {
		// TODO Auto-generated method stub
		int offSet=(int)param.get("cPage");
		int limit=(int)param.get("numPerpage");
		
		return session.selectList("member.searchMembers",param,new RowBounds((offSet-1)*limit,limit));
	}

	@Override
	public int searchMembersCount(SqlSessionTemplate session, Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchMembersCount",param);
	}

	@Override
	public List<OrderDetail> selectOrderDetails(SqlSessionTemplate session) {
		// TODO Auto-generated method stub
		return session.selectList("orderDetail.orderLists");
	}

	@Override
	public List<OrderDetail> selectOrderDetailsCode(SqlSessionTemplate session, long orderCode) {
		// TODO Auto-generated method stub
		return session.selectList("orderDetail.orderListsCode", orderCode);
	}

	@Override
	public int minusProductAmount(SqlSessionTemplate session, Map<String,Object> param) {
		// TODO Auto-generated method stub
		return session.insert("product.minusProductAmount",param);
	}
}
