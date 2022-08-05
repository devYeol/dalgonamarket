package com.dal.dalgona.working.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.working.model.dao.JDHMemberRepository;

@Service
public class JDHMemberService {
	
	@Autowired
	private JDHMemberRepository repo;
	
	public Member jdhInsertTest(Member m) {
		
		return repo.save(m);
		
	}

}
