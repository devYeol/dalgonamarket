package com.dal.dalgona.working.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.dao.JdhDao;



@Service
public class JdhServiceImpl implements JdhService {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private JdhDao dao;
	
	@Autowired
	BCryptPasswordEncoder bc;

	@Override
	public Member jdhInsertTest(Member m) {
		// TODO Auto-generated method stub
		return null;
	}
	
//	@Override
//	public Member login(Member m) {
//		return dao.login(session, m);
//	}
//
//	@Override
//	public int insertMember(Member m) {
////		m.setPassword(bc.encode());
//		return dao.insertMember(session,m);
//	}	
	
	
}
