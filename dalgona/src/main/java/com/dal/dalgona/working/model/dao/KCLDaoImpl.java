package com.dal.dalgona.working.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.dal.dalgona.common.model.vo.Member;

@Repository
public class KCLDaoImpl implements KCLDao {

	@Override
	public Member login(SqlSessionTemplate session, Member m) {
		return session.selectOne("member.selectMember",m);
	}

	@Override
	public int insertMember(SqlSessionTemplate session, Member m) {
		return session.insert("member.insertMember",m);
	}
	
	@Override
	public int idCheck(SqlSessionTemplate session, String memberId) {
		return session.selectOne("member.idCheck", memberId);
	}
	
	@Override
	public String findId(SqlSessionTemplate session, String memberEmail) {
		return session.selectOne("member.findId", memberEmail);
	}
	
	@Override
	public int findIdCheck(SqlSessionTemplate session, String memberEmail) {
		return session.selectOne("member.findIdCheck", memberEmail);
	}
}
