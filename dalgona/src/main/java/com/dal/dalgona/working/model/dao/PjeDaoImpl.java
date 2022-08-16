package com.dal.dalgona.working.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;
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
}
