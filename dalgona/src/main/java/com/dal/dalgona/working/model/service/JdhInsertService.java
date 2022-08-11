package com.dal.dalgona.working.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;


@Service
public class JdhInsertService {
	
	@Autowired
	private JdhInsertDao jdhDao;
	
	public Member jdhInsertTest(Member m) {
		return jdhDao.save(m);
	}

}
