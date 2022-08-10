package com.dal.dalgona.working.model.service;

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
	
	public Page<Member> selectMembers(PageRequest pagerequest) {
		return dao.findAll(pagerequest);
	}
	
//	public Page<Member> selectMembers(PageRequest pagerequest, String searchType, String keyword, String searchGen) {
//		return dao.findby(pagerequest, searchType, keyword, searchGen);
//	}
}
