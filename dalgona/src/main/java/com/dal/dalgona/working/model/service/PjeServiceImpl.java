package com.dal.dalgona.working.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.dao.PjeDao;
import com.dal.dalgona.working.model.dao.PjeDaoJpa;

@Service
public class PjeServiceImpl implements PjeService {
	@Autowired
	private PjeDaoJpa daoJpa;
	
	@Autowired
	private PjeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	public Page<Member> selectMembers(PageRequest pagerequest) {
		return daoJpa.findAll(pagerequest);
	}

	@Override
	public List<Member> searchMembers(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.searchMembers(session, param);
	}
	
	@Override
	public int searchMembersCount(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return dao.searchMembersCount(session, param);
	}
	
}
