package com.dal.dalgona.working.model.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.dao.PjeDao;

@Service
public class PjeService {
	@Autowired
	private PjeDao dao;
	
//	@Autowired
//	private EntityManager em;
//	
//	@Autowired
//	private EntityTransaction et;
	
	public Page<Member> selectMembers(PageRequest pagerequest) {
		return dao.findAll(pagerequest);
	}
	
//	public List<Member> searchMembers(String keyword) {
//		return dao.searchMembers(em, keyword);
//	}
}
