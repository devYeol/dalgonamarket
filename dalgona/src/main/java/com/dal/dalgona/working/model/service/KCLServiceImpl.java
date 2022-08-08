package com.dal.dalgona.working.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.dao.KCLDao;

import lombok.extern.slf4j.Slf4j;

@Service
public class KCLServiceImpl implements KCLService {

	@Autowired
	private KCLDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Member login(Member m) {
		return dao.login(session, m);
	}

	@Override
	public int insertMember(Member m) {
		return dao.insertMember(session,m);
	}	
}
