package com.dal.dalgona.working.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.dal.dalgona.common.model.vo.Member;

public interface KCLDao {
	
	Member login(SqlSessionTemplate session, Member m);
	
	int insertMember(SqlSessionTemplate session, Member m);
	
	int idCheck(SqlSessionTemplate session, String memberId);
	
	String findId(SqlSessionTemplate session, String memberEmail)throws Exception;
	
	int findIdCheck(SqlSessionTemplate session, String memberEmail)throws Exception;
}
