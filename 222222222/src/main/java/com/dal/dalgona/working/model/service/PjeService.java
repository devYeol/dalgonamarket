package com.dal.dalgona.working.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Member;
import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.dao.PjeDao;

@Service
public class PjeService {
	@Autowired
	private PjeDao dao;
	
	public List<Member> selectMembers() {
		return dao.findAll(Sort.by(Sort.Direction.DESC,"memberName"));
	}
}
