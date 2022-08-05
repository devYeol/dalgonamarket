package com.dal.dalgona.working.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.dal.dalgona.common.model.vo.Member;

public interface KCLDao {
	
	Member login(SqlSession session, Member m);
}
