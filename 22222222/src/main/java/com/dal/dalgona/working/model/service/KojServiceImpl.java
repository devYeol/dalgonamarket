package com.dal.dalgona.working.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dal.dalgona.common.model.vo.Product;
import com.dal.dalgona.working.model.dao.KojDao;

@Service
public class KojServiceImpl implements KojService {
	
	@Autowired
	private KojDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public Product selectProduct(long productCode) {
		// TODO Auto-generated method stub
		return dao.selectProduct(session,productCode);
	}

}
