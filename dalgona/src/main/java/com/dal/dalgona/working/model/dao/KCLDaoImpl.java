package com.dal.dalgona.working.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;

@Repository
public class KCLDaoImpl implements KCLDao {

	@Override
	public Member login(SqlSession session, Member m) {
		return session.selectOne("member.selectMember",m);
	}

}
