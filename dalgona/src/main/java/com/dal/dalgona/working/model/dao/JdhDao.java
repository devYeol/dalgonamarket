package com.dal.dalgona.working.model.dao;

import com.dal.dalgona.common.model.vo.Member;

public interface JdhDao {
	
	Member save(Member m);
	
	Member findByMemberId(String memberId);
	
//	Member login(SqlSessionTemplate session, Member m);
//	
//	int insertMember(SqlSessionTemplate session, Member m);

}
